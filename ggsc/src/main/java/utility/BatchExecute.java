package utility;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import ggsc.support.web.Batch;


@Component
public class BatchExecute implements ApplicationListener<ContextRefreshedEvent>{
	// Application Listener 를 상속 받음으로써 서버라는 Context가 로드 될 때 실행되는 객체이다 . 
	// 이 객체는 서버 로드시 필요한 정보들을 메모리 상에 로드하기 위해 있는 것 일텐데 프로젝트 내 에서 스프링이 왠만한 작업들을 다 
	// 처리하기 때문에 이 ApplicationListener 는 행하는 것이 없는 듯 하다
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		 SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	        try {
	        	System.out.println("=================================BATCH START=================================================");
	            // Scheduler scheduler = schedulerFactory.getScheduler();

	            //JobDetail job = newJob(Batch.class).withIdentity("jobName", Scheduler.DEFAULT_GROUP).build();
	            
	            // 5 seconds action
	           /* Trigger trigger = newTrigger().withIdentity("trggerName", Scheduler.DEFAULT_GROUP)
	                    .withSchedule(cronSchedule("0 0 5 * * ?")).build();
	            
	            Trigger trigger = newTrigger().withIdentity("triggerName", Scheduler.DEFAULT_GROUP)
	                    .withSchedule(cronSchedule("0/50 * * * * ?")).build();
	            
	            scheduler.scheduleJob(job, trigger);
	            scheduler.start();*/
	            
	        	System.out.println("onApplicationEvent Start");
	            
	            System.out.println("=================================BATCH END=================================================");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		
	}
	
}


/*public class BatchExecute implements ServletContextListener{

	// private static final Logger logger = LoggerFactory.getLogger(StartupApplication.class);
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		 SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	        try {
	        	System.out.println("=================================BATCH START=================================================");
	            Scheduler scheduler = schedulerFactory.getScheduler();

	            JobDetail job = newJob(Batch.class).withIdentity("jobName", Scheduler.DEFAULT_GROUP).build();
	            
	            // 5 seconds action
	            Trigger trigger = newTrigger().withIdentity("trggerName", Scheduler.DEFAULT_GROUP)
	                    .withSchedule(cronSchedule("0 0 5 * * ?")).build();
	            
	            Trigger trigger = newTrigger().withIdentity("triggerName", Scheduler.DEFAULT_GROUP)
	                    .withSchedule(cronSchedule("0/50 * * * * ?")).build();

	            scheduler.scheduleJob(job, trigger);
	            scheduler.start();
	            
	            
	            System.out.println("=================================BATCH END=================================================");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
	
}*/
