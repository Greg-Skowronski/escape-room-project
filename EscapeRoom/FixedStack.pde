public class FixedStack
{
    private Block[] stack;
    private int size;
    private int top;

    public FixedStack(int size)
    {
        this.stack = new Block[size];
        this.top = -1;
        this.size = size;
    }

    public void push(Block obj)
    {
        if (top >= size)
            return;
            
        stack[++top] = obj;
    }

    public Block pop()
    {
        if (top < 0) return null;
        Block obj = stack[top--];
        stack[top + 1] = null;
        return obj;
    }

    public int size()
    {
        return size;
    }

    public int elements()
    {
        return top + 1;
    }
    
    
    public boolean isEmpty(){
        
        return ((top >= 0) ? true : false);
    }
    
    
    public void display(){
    
      for(int i = 0; i < stack.length; i++){
      
        if(stack[i] != null){
          stack[i].display();
        }
          
      }
    }
}
