# frozen_string_literal: true

# Command template
class Command
  def validate(_bitmap, *_args)
    raise NotImplementedError, 'command must implements validate method'
  end

  def run(_bitmap, *_args)
    raise NotImplementedError, 'command must implements run method'
  end

  def execute(bitmap, args)
    args = args.split(' ') if args.instance_of? String
    validate(bitmap, args)
    run(bitmap, *args)
  end
end
