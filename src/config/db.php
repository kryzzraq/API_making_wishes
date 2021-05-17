<?
class DB
{
  private $host = HOST_BD;
  private $db = BD;
  private $user = USER_BD;
  private $pw = PW_BD;

  public function connect()
  {
    @$con = new mysqli($this->host,$this->user,$this->pw,$this->db);
    @$con->set_charset("utf8");
    if(@$con->connect_errno){
      return false;
    }else{
      $con->set_charset("utf8");
      return $con;
    }
  }

}