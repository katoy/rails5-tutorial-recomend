module RecommendService
  class Recf
    attr_accessor :recfs
    attr_accessor :fixed_content_hash, :possible_content_hash

    def initialize(recfs = ::Recf.all)
      @recfs = recfs.order(:order)
    end

    def make(valid_content_hash = { book: Book.all, music: Music.all, movie: Movie.all })
      setup_target_content(valid_content_hash)
      recfs.each { |recf| recf.content = target_content(recf) }.select(&:content)
    end

    private

    def setup_target_content(valid_content_hash)
      recf_hash = recfs.group_by(&:content_type)
      fixed_id_hash = recf_hash.map { |type, recfs| [type, recfs.map(&:fixed_id).compact.uniq] }.to_h
      valid_fixed_content_hash = { book: ::Book.all, music: ::Music.all, movie: ::Movie.all }

      @fixed_content_hash = fixed_id_hash.map do |type, ids|
        contents = valid_fixed_content_hash[type.to_sym].where(id: ids)
        contents_hash = contents.map { |content| [content.id, content] }.to_h
        [type, contents_hash]
      end.to_h

      @possible_content_hash = valid_content_hash.map do |type_sym, contents|
        k = type_sym.to_s
        [k, contents.where.not(id: fixed_id_hash[k]).sample(recf_hash[k].size)]
      end.to_h
    end

    def target_content(recf)
      recf.fixed_flag ? fixed_content(recf) : possible_content(recf)
    end

    def fixed_content(recf)
      content_type = recf.content_type
      return nil if fixed_content_hash[content_type].nil?
      fixed_content_hash[content_type][recf.fixed_id]
    end

    def possible_content(recf)
      content_type = recf.content_type
      return if possible_content_hash[content_type].nil?
      possible_content_hash[content_type].shift
    end
  end
end
