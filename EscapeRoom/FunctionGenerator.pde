public abstract class FunctionGenerator {
  public FunctionGenerator(int period)
  {
    this.period = period;
  }
  protected int period;
  public abstract double Generate(double time);
}

public class SineGenerator extends FunctionGenerator {
  public SineGenerator(int period)
  {
    super(period);
  }
  public double Generate(double time)
  {
    double val =Math.sin(2*Math.PI*(double)time/(double)period);
    println("\r"+val);
    return val;
  }
}
public class HalfRectSineGenerator extends FunctionGenerator {
  protected float reducedByPercentage;
  public HalfRectSineGenerator(int period, float reducedByPercentage)
  {
    super(period);
    this.reducedByPercentage = reducedByPercentage;
  }
  public double Generate(double time)
  {
    double sinVal = Math.sin(2*Math.PI*(double)time/(double)period); 
    return sinVal>=0?(1-reducedByPercentage)*sinVal:0;
  }
}
public class FullRectSineGenerator extends FunctionGenerator {
  protected float reducedByPercentage;
  public FullRectSineGenerator(int period, float reducedByPercentage)
  {
    super(period);
    this.reducedByPercentage = reducedByPercentage;
  }
  public double Generate(double time)
  {
    return (1-reducedByPercentage)*Math.abs(Math.sin(2*Math.PI*(double)time/(double)period));
  }
}
public class StableFullRectSineGenerator extends FunctionGenerator {
  protected float reducedByPercentage, timeConst;
  protected double lastSample;
  public StableFullRectSineGenerator(int period, float reducedByPercentage, float timeConst)
  {
    super(period);
    this.reducedByPercentage = reducedByPercentage;
    this.timeConst = timeConst;
  }
  public double Generate(double time)
  {
    double funcVal = (1-reducedByPercentage)*Math.abs(Math.sin(2*Math.PI*(double)time/(double)period));
    lastSample = funcVal/2 + lastSample/2*timeConst;
    return lastSample;
  }
}
public class StableHalfRectSineGenerator extends FunctionGenerator {
  protected float reducedByPercentage, timeConst;
  protected double lastSample;
  protected double capChargeVoltage;
  double capTime = 0;
  public StableHalfRectSineGenerator(int period, float reducedByPercentage, float timeConst)
  {
    super(period);
    this.reducedByPercentage = reducedByPercentage;
    this.timeConst = timeConst;
  }
  public double Generate(double time)
  {
    double sinVal = Math.sin(2*Math.PI*(double)time/(double)period); 
    double funcVal = sinVal>=0?(1-reducedByPercentage)*sinVal:0;
    
    if(funcVal>lastSample && funcVal>0)
    {
      lastSample = funcVal;
      capTime = time;
      capChargeVoltage = funcVal;
      return funcVal;
    }
    else
    {
      capChargeVoltage = capChargeVoltage*(1-Math.exp(-(time-capTime)/10));
      lastSample = capChargeVoltage;
      return capChargeVoltage;
    }
   
  }
}
public class NoiseGenerator extends FunctionGenerator {
  Random rnd;
  private float level;
  public NoiseGenerator(int period, float level)
  {
    super(period);
    rnd = new Random();
    this.level = level;
  }
  public double Generate(double time)
  {
    return (rnd.nextDouble()-0.5)*level;
  }
}
