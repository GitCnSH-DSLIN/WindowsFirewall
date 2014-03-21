{*******************************************************}
{                                                       }
{                Windows Firewall example               }
{                                                       }
{               Copyright  �  2014                      }
{                                                       }
{           Journeyman Consultancy & Services           }
{                                                       }
{*******************************************************}

program WindowsFirewall;

{$APPTYPE CONSOLE}
{$WEAKLINKRTTI OFF}
{$R *.res}

uses
  System.SysUtils,
  System.Win.ComObj,
  Winapi.ActiveX,
  NetFwTypeLib_TLB in 'NetFwTypeLib_TLB.pas',
  System.Win.Firewall in 'System.Win.Firewall.pas';

procedure CreateNewBlockingRule;
var
  LFirewall: TWindowsFirewall;
  LRule: TWindowsFirewall.TWindowsFirewallRule;
  LBlockIPs: TArray<string>;
begin
  LFirewall := TWindowsFirewall.Create;
  try
    LBlockIPs := TArray<string>.Create(
                                       '1.209.82.198',
                                       '108.61.133.234',
                                       '108.61.137.10',
                                       '108.61.137.26',
                                       '109.73.68.233',
                                       '110.170.137.26',
                                       '110.77.137.151',
                                       '110.85.75.206',
                                       '110.88.193.49',
                                       '111.1.36.24',
                                       '111.11.27.194',
                                       '111.11.27.196',
                                       '111.13.46.125',
                                       '112.65.230.187',
                                       '114.80.136.112',
                                       '114.80.226.71',
                                       '115.236.22.226',
                                       '115.29.164.173',
                                       '116.112.66.102',
                                       '116.213.51.221',
                                       '116.226.49.175',
                                       '116.228.55.184',
                                       '116.228.55.217',
                                       '116.236.216.116',
                                       '116.255.241.111',
                                       '117.163.196.214',
                                       '117.164.160.88',
                                       '117.164.210.201',
                                       '117.169.214.212',
                                       '117.170.13.54',
                                       '117.170.15.25',
                                       '117.170.226.169',
                                       '117.170.244.138',
                                       '117.172.160.44',
                                       '117.173.189.142',
                                       '117.173.189.208',
                                       '117.28.255.124',
                                       '118.186.69.62',
                                       '118.189.11.10',
                                       '118.26.57.13',
                                       '118.85.208.222',
                                       '118.97.95.182',
                                       '118.97.95.185',
                                       '119.233.255.24',
                                       '119.254.66.7',
                                       '12.107.206.114',
                                       '120.202.249.195',
                                       '121.17.16.2',
                                       '122.143.7.227',
                                       '122.154.97.126',
                                       '122.225.36.204',
                                       '122.226.95.58',
                                       '122.96.59.100',
                                       '122.96.59.106',
                                       '122.96.59.99',
                                       '124.160.194.72',
                                       '124.172.221.168',
                                       '124.240.187.79',
                                       '124.67.215.4',
                                       '124.67.215.9',
                                       '125.88.8.28',
                                       '128.134.244.41',
                                       '133.242.152.36',
                                       '14.18.251.176',
                                       '14.18.251.183',
                                       '14.18.251.186',
                                       '150.70.172.203',
                                       '150.70.173.54',
                                       '172.245.59.203',
                                       '173.208.183.155',
                                       '173.213.96.229',
                                       '180.149.96.169',
                                       '183.207.228.11',
                                       '183.207.228.119',
                                       '183.207.228.12',
                                       '183.207.228.14',
                                       '183.207.228.2',
                                       '183.207.228.40',
                                       '183.216.250.22',
                                       '183.217.153.28',
                                       '183.217.185.6',
                                       '183.218.80.147',
                                       '183.219.240.166',
                                       '183.219.240.169',
                                       '183.219.85.173',
                                       '183.221.50.25',
                                       '183.223.21.139',
                                       '183.61.240.126',
                                       '186.88.104.94',
                                       '186.91.122.55',
                                       '186.91.167.1',
                                       '186.91.188.8',
                                       '186.92.132.55',
                                       '186.92.251.75',
                                       '186.92.71.134',
                                       '186.93.132.30',
                                       '186.93.139.90',
                                       '186.94.21.35',
                                       '186.94.49.73',
                                       '186.94.89.85',
                                       '186.94.95.9',
                                       '186.95.71.183',
                                       '188.168.82.131',
                                       '189.9.0.176',
                                       '190.102.17.180',
                                       '190.102.17.240',
                                       '190.198.14.216',
                                       '190.198.191.176',
                                       '190.198.45.123',
                                       '190.203.119.78',
                                       '190.203.33.227',
                                       '190.203.49.140',
                                       '190.205.201.237',
                                       '190.207.219.99',
                                       '190.36.10.42',
                                       '190.36.110.126',
                                       '190.74.193.97',
                                       '192.111.148.89',
                                       '192.147.213.222',
                                       '192.187.112.146',
                                       '192.99.10.87',
                                       '196.1.94.122',
                                       '198.27.126.25',
                                       '198.50.159.194',
                                       '198.56.208.37',
                                       '198.71.82.72',
                                       '199.200.120.140',
                                       '200.8.145.2',
                                       '200.84.172.61',
                                       '201.209.58.252',
                                       '201.211.176.104',
                                       '201.211.225.55',
                                       '202.143.148.58',
                                       '202.28.77.5',
                                       '202.71.247.14',
                                       '203.125.204.242',
                                       '203.64.247.37',
                                       '210.22.59.58',
                                       '211.103.210.38',
                                       '211.157.104.100',
                                       '211.167.103.140',
                                       '211.167.112.14',
                                       '211.232.45.42',
                                       '212.107.116.234',
                                       '212.138.92.17',
                                       '213.135.234.6',
                                       '218.108.170.164',
                                       '218.108.170.166',
                                       '218.108.192.205',
                                       '218.108.232.187',
                                       '218.108.232.93',
                                       '218.207.102.106',
                                       '219.150.204.30',
                                       '220.132.19.136',
                                       '220.168.83.251',
                                       '220.181.28.252',
                                       '220.248.229.40',
                                       '221.10.102.203',
                                       '221.130.162.48',
                                       '221.130.17.33',
                                       '221.130.17.46',
                                       '221.130.17.57',
                                       '221.130.18.121',
                                       '221.130.29.184',
                                       '221.176.23.242',
                                       '221.181.192.29',
                                       '221.232.144.164',
                                       '221.232.247.27',
                                       '221.7.11.102',
                                       '221.7.11.23',
                                       '221.7.11.24',
                                       '222.178.10.241',
                                       '222.178.10.247',
                                       '222.18.127.40',
                                       '222.186.20.10',
                                       '223.82.151.157',
                                       '23.89.139.30',
                                       '23.94.104.112',
                                       '31.163.198.94',
                                       '31.41.216.123',
                                       '36.250.89.99',
                                       '37.187.79.141',
                                       '41.206.62.70',
                                       '46.48.153.54',
                                       '49.213.18.67',
                                       '5.226.86.83',
                                       '58.20.127.100',
                                       '58.20.127.26',
                                       '58.20.50.198',
                                       '58.20.50.200',
                                       '59.126.26.176',
                                       '59.52.95.118',
                                       '59.78.36.170',
                                       '60.190.138.138',
                                       '60.190.138.145',
                                       '60.190.138.149',
                                       '60.222.224.135',
                                       '61.130.136.44',
                                       '61.135.176.230',
                                       '61.147.82.87',
                                       '61.155.136.188',
                                       '61.174.9.96',
                                       '61.55.141.10',
                                       '61.55.141.11',
                                       '63.141.243.68',
                                       '66.35.68.146',
                                       '69.197.163.229',
                                       '74.116.156.210',
                                       '77.22.165.45',
                                       '85.185.45.11',
                                       '85.185.45.15',
                                       '85.185.45.16',
                                       '85.185.45.18',
                                       '85.185.45.20',
                                       '85.185.45.23',
                                       '85.185.45.5',
                                       '85.185.45.6',
                                       '85.185.45.9'
                                       );

    LRule := LFirewall.Rules.CreateRule;
    LRule.Profile := [ALL];
    LRule.Action := Block;
    LRule.Name := 'Block IPs which sends SPAM via SMTP';
    LRule.Description := 'Blocks IPs which tries to send spam via SMTP';
    LRule.AddIPs(LBlockIPs);
    LRule.Enabled := True;
    LFirewall.Rules.AddRule(LRule);
  finally
    LFirewall.Free;
  end;
end;

procedure CreateRule;
begin
  CreateNewBlockingRule;
end;

procedure ShowRule(const ARule: TWindowsFirewall.TWindowsFirewallRule);
begin
  WriteLn('Name: ', ARule.Name);
  WriteLn('Action: ', ARule.Action.ToString);
  WriteLn('Description: ', ARule.Description);
  WriteLn('Direction: ', ARule.Direction.ToString);
  WriteLn('Enabled: ', ARule.Enabled);
  WriteLn('Profile: ', ARule.Profile.ToString);
  WriteLn('Interface Types: ', ARule.InterfaceTypes.ToString);
  WriteLn('-----------------------------------');
end;

procedure EnumRules;
var
  LFirewall: TWindowsFirewall;
  LRule: TWindowsFirewall.TWindowsFirewallRule;
  LRuleName, LInterface: string;
begin
  LFirewall := TWindowsFirewall.Create;
  try
    for LRuleName in TArray<string>.Create('Doesn''t exist', 'Test rule using TWindowsFirewall') do
      if LFirewall.Rules.FindRule(LRuleName) then
        begin
          LRule := LFirewall.Rules[LRuleName];
          ShowRule(LRule);
          LRule.Free;
        end;

    for LRule in LFirewall.Rules do
      ShowRule(LRule);

  finally
    LFirewall.Free;
  end;
end;

begin
  EnumRules;
end.

