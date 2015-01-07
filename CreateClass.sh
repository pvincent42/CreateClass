class=$1
CLASS=`echo "$class" | tr '[:lower:]' '[:upper:]'`
CLASS+="_CLASS_HPP"
hppname=$class
hppname+=".class.hpp"
touch $hppname
echo "
#ifndef		$CLASS
# define	$CLASS

class $class
{
	public:
		$class(void);
		~$class(void);
		$class($class const & src);

		$class & operator = ($class const & rhs);
};

#endif" > $hppname
cppname=$class
cppname+=".class.cpp"
touch $cppname
echo "#include \"$hppname\"

$class::$class(void)
{
	return ;
}

$class::$class($class const & src)
{
	*this = src;

	return ;
}


$class &
$class::operator=($class const & rhs)
{
	if (this != &rhs)
	{
			//// PUT VALUE HERE
			//// this-> val = rhs.getVal();
	}
	return (*this);
}

$class::~$class(void)
{
	return ;
}" > $cppname
