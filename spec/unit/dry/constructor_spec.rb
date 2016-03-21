RSpec.describe Dry::Constructor do
  let(:one) { double('One') }
  let(:two) { double('Two') }
  let(:three) { double('Three') }

  describe '.()' do
    let(:instance) { klass.new(one, two, three) }

    context 'default visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor(:one, :two, :three)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines private readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'protected visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor(:one, :two, :three, visibility: :protected)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines protected readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'public visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor(:one, :two, :three, visibility: :public)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines public readers' do
        expect { instance.one }.to_not raise_error
        expect { instance.two }.to_not raise_error
        expect { instance.three }.to_not raise_error
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end
  end

  describe '.Splat' do
    let(:instance) { klass.new(one, two, three) }

    context 'default visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Splat(:one, :two, :three)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines private readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'protected visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Splat(:one, :two, :three, visibility: :protected)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines protected readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'public visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Splat(:one, :two, :three, visibility: :public)
        end
      end

      it 'assigns each constructor splat arg to an ivar and defines public readers' do
        expect { instance.one }.to_not raise_error
        expect { instance.two }.to_not raise_error
        expect { instance.three }.to_not raise_error
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end
  end

  describe '.Hash' do
    let(:instance) { klass.new(one: one, two: two, three: three) }

    context 'default visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Hash(:one, :two, :three)
        end
      end

      it 'assigns each constructor hash key value pair to an ivar and defines private readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'protected visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Hash(:one, :two, :three, visibility: :protected)
        end
      end

      it 'assigns each constructor hash key value pair to an ivar and defines protected readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'public visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Hash(:one, :two, :three, visibility: :public)
        end
      end

      it 'assigns each constructor hash key value pair to an ivar and defines public readers' do
        expect { instance.one }.to_not raise_error
        expect { instance.two }.to_not raise_error
        expect { instance.three }.to_not raise_error
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end
  end

  describe '.Kwargs' do
    let(:instance) { klass.new(one: one, two: two, three: three) }

    context 'default visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Kwargs(:one, :two, :three)
        end
      end

      it 'assigns each constructor keyword arg to an ivar and defines private readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'protected visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Kwargs(:one, :two, :three, visibility: :protected)
        end
      end

      it 'assigns each constructor keyword arg to an ivar and defines protected readers' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end

    context 'public visibility' do
      let(:klass) do
        Class.new do
          include Dry::Constructor::Kwargs(:one, :two, :three, visibility: :public)
        end
      end

      it 'assigns each constructor keyword arg to an ivar and defines public readers' do
        expect { instance.one }.to_not raise_error
        expect { instance.two }.to_not raise_error
        expect { instance.three }.to_not raise_error
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end
  end
end
