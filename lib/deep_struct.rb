require 'ostruct'
class DeepStruct < OpenStruct
  def initialize(hash = nil)
    @table = {}
    @hash_table = {}

    return unless hash
    hash.each do |k, v|
      recursive_initializer(v) if v.is_a?(Array)

      @table[k.to_sym] = (v.is_a?(Hash) ? self.class.new(v) : v)
      @hash_table[k.to_sym] = v
      new_ostruct_member!(k)
    end
  end

  def to_h
    self.marshal_dump.map{ |key, element|
      if element.is_a?(DeepStruct)
        {key => element.to_h}
      else
        {key => element}
      end
    }.reduce(&:merge)
  end

  protected

  def recursive_initializer(item)
    item.collect! do |val|
      if val.is_a?(Hash)
        self.class.new(val)
      elsif val.is_a?(Array)
        val.map{|v| recursive_initializer(v) }
      else
        val
      end
    end
  end
end
