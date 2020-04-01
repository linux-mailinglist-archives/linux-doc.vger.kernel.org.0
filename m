Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A1719AB07
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2020 13:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732269AbgDALrT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Apr 2020 07:47:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35567 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732026AbgDALrS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Apr 2020 07:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585741636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jtQiMLUrObG2ZqOqqL0sf6vOhLO3JFeraOf9+M5iTFs=;
        b=YiPpsj3OxwSCz8FBvhao3i2gAcYqMlun+m5Pj843bH+0oh5VEgp0KMfKlVfODCexaO73rH
        W0mfYVxK065j56E9AZQ8XQoUQd3ZWfUF5f7HnnflWqe26TXqQQBIWXjE0P7miVYKhjXlWx
        qauISDEVI8uoVsIW/WRTkA1Pei92myM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-hZfC9eagMo2_nEWjaV61ew-1; Wed, 01 Apr 2020 07:47:08 -0400
X-MC-Unique: hZfC9eagMo2_nEWjaV61ew-1
Received: by mail-wr1-f70.google.com with SMTP id v14so14457576wrq.13
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2020 04:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jtQiMLUrObG2ZqOqqL0sf6vOhLO3JFeraOf9+M5iTFs=;
        b=FWVUe8oOB0KxsWbZfaZYvB9Cp7LSsC54he2JUqLU1QvCVTafqpEnrCKxethpaajyNV
         0wvAtofsUJuKp/HLKKF6Da5vf0WtRlPAtdi8PhBezNMSB6t2ZvaPDwybotpV7QIp8veH
         XP1spL3yumvm/OhXQNyP1O4o/eFaxjszpVc5qhHh+1n0+4UY1aBZKKWVLD9x4ptnJ4or
         dPHRg5Dr0lLLbH5rahMkVhMVvL4HHIl6PC411DiW87/CujKCceQJ2f5FDl4Bwsu0dLUV
         /MmHjGAFRhUu8yDwuB8w0k33wmG4k4Api7iTDiv8g+9NKtFoyb0lfkV6XDIAXDbqsiPJ
         8c5w==
X-Gm-Message-State: ANhLgQ089rYiE5V9WaNZNjpjsWUQ5Pss6KqThfuwKSNy4XOfLE7++dJN
        GljQsJkhEemaaxYeFchSzSHGLWZKs/FliB4U4XYFLFG2Yor+nlJ41arL87CRcX4UvGA9ifRKk55
        0XxyVql84Kp0Zg9ulvKj6
X-Received: by 2002:adf:ea8e:: with SMTP id s14mr25597586wrm.206.1585741627316;
        Wed, 01 Apr 2020 04:47:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2V9GcpkSj0M42BT9Akh267wU4WB50noGdCC1E3oybQPVuSb1g9wyC8ImkOIZvR+7USqbBPw==
X-Received: by 2002:adf:ea8e:: with SMTP id s14mr25597563wrm.206.1585741627069;
        Wed, 01 Apr 2020 04:47:07 -0700 (PDT)
Received: from x1.bristot.me ([87.19.200.153])
        by smtp.gmail.com with ESMTPSA id d206sm2282983wmf.29.2020.04.01.04.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 04:47:06 -0700 (PDT)
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
To:     Peter Zijlstra <peterz@infradead.org>,
        John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
 <20200401103520.GA20713@hirez.programming.kicks-ass.net>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
Date:   Wed, 1 Apr 2020 13:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401103520.GA20713@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/1/20 12:35 PM, Peter Zijlstra wrote:
>> +Scheduler State Transition
>> +==========================
>> +
>> +A very high level scheduler state transition flow with a few states can be
>> +depicted as follows.
>> +
>> +.. kernel-render:: DOT
>> +   :alt: DOT digraph of Scheduler state transition
>> +   :caption: Scheduler state transition
>> +
>> +   digraph sched_transition {
>> +      node [shape = point,  label="exisiting task\n calls fork()"]; fork
>> +      node [shape = box, label="TASK_NEW\n(Ready to run)"] tsk_new;
>> +      node [shape = box, label="TASK_RUNNING\n(Ready to run)"] tsk_ready_run;
>> +      node [shape = box, label="TASK_RUNNING\n(Running)"] tsk_running;
>> +      node [shape = box, label="TASK_DEAD\nEXIT_ZOMBIE"] exit_zombie;
>> +      node [shape = box, label="TASK_INTERRUPTIBLE\nTASK_UNINTERRUPTIBLE\nTASK_WAKEKILL"] tsk_int;
>> +      fork -> tsk_new [ label = "task\nforks" ];
>> +      tsk_new -> tsk_ready_run;
>> +      tsk_ready_run -> tsk_running [ label = "schedule() calls context_switch()" ];
>> +      tsk_running -> tsk_ready_run [ label = "task is pre-empted" ];
>> +      subgraph int {
>> +         tsk_running -> tsk_int [ label = "task needs to wait for event" ];
>> +         tsk_int ->  tsk_ready_run [ label = "event occurred" ];
>> +      }
>> +      tsk_int ->  exit_zombie [ label = "task exits via do_exit()" ];
>> +   }
> And that is a prime example of why I hates RST, it pretty much mandates
> you view this with something other than a text editor.

The good thing about the dot format is that we can convert it to many other
formats, including text:

[bristot@x1 ~]$ cat sched_transition.dot | graph-easy 

                       *

                       |
                       | task
                       | forks
                       v
                     +------------------------------------+
                     |              TASK_NEW              |
                     |           (Ready to run)           |
                     +------------------------------------+
                       |
                       |
                       v
+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+
'                                     int                                            '
'                                                                                    '
'                    +------------------------------------+                          '
'                    |            TASK_RUNNING            |                          '
'   +--------------> |           (Ready to run)           | <--+                     '
'   |                +------------------------------------+    |                     '
'   |                  |                                       |                     '
'   |                  | schedule() calls context_switch()     | task is pre-empted  '
'   |                  v                                       |                     '
'   |                +------------------------------------+    |                     '
'   |                |            TASK_RUNNING            |    |                     '
'   |                |             (Running)              | ---+                     '
'   | event occurred +------------------------------------+                          '
'   |                  |                                                             '
'   |                  |                                      - - - - - - - - - - - -+
'   |                  |                                    '
'   |                  | task needs to wait for event       '
'   |                  v                                    '
'   |                +------------------------------------+ '
'   |                |         TASK_INTERRUPTIBLE         | '
'   |                |        TASK_UNINTERRUPTIBLE        | '
'   +--------------- |           TASK_WAKEKILL            | '
'                    +------------------------------------+ '
'                                                           '
+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
                       |
                       | task exits via do_exit()
                       v
                     +------------------------------------+
                     |             TASK_DEAD              |
                     |            EXIT_ZOMBIE             |
                     +------------------------------------+


Is there a way to also add this representation, while hiding it
when using a graphical reader?

PS: I know nothing about rst, only about rts - real-time systems...
yeah, it is a bad joke haha.

> Also, Daniel, you modeled all this, is the above anywhere close?

hum... let's say that we modeled things we a different goal. Here the
idea is to explain, document... not to create an explicit model.

For instance, there is the context switch _in_, but not the _out_ in the
above example.

But, well, if the goal is to document, it is nice to have graphical
representations.

>> +Scheduler provides trace points tracing all major events of the scheduler.
>> +The tracepoints are defined in ::
>> +
>> +  include/trace/events/sched.h
>> +
>> +Using these treacepoints it is possible to model the scheduler state transition
>> +in an automata model. The following conference paper discusses such modeling.

this is a workshop paper.

>> +
>> +https://www.researchgate.net/publication/332440267_Modeling_the_Behavior_of_Threads_in_the_PREEMPT_RT_Linux_Kernel_Using_Automata
> Ah, you've found Daniel ;-)

:-)

This is a better reference (a journal paper).

Daniel B. de Oliveira, Rômulo S. de Oliveira, Tommaso Cucinotta, **A thread
synchronization model for the PREEMPT_RT Linux kernel**, *Journal of Systems
Architecture*, Volume 107, 2020, 101729, ISSN 1383-7621,
https://doi.org/10.1016/j.sysarc.2020.101729.

-- Daniel

