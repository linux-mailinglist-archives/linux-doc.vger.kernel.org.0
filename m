Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8E059F824
	for <lists+linux-doc@lfdr.de>; Wed, 24 Aug 2022 12:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbiHXKqs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Aug 2022 06:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbiHXKqe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 06:46:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D79D8E98A
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 03:46:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id q2so19368252edb.6
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Aj++Fk/W1JhvrURKcMUAUKoprlyW7CHD6tgqm6w3ip8=;
        b=6Iyv3/J5KocnAeNqHO+9drc0u5aILR13sqA6Kvkg5zjYCKXLwJp7Cu69hxIFDTViq+
         HZYQlApQOCAUdvrC9loeA0eKBfIGGnditmSzzpOZ90vXY1TuDg3lsp31JoFuqP0/wSxU
         XSX4NHtEDrxhXz5fAmvszL3QwtVPl4/KNvLyXFAGbl+mLr5I/5wj2uzT7zmP6iMEYfIJ
         9vo0CLZE+RH2KthBtZt8o0SxWYfNCTmfSjT2pcY6uS8qAGOOCRMdyXDM/SlcpnzLMib+
         au4RGN94O395cioi2TT229XLk3Lnw/U/OjFCbsyXY5/YzL0Dm8dJTgMarbwsOWWBdf1o
         S4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Aj++Fk/W1JhvrURKcMUAUKoprlyW7CHD6tgqm6w3ip8=;
        b=YLb8OYTDbdUFR9TiRpZWP6ZmpQ4puwUp4g0DdWPgfFhlwB8MwG1UNM5JcnRfR0sp9X
         uMW/vT+cyQpAbQn+DK0oInqDToVv5XIMRAl1NaUggAJjYVh7GG1vRtD+DDbWrULKmW31
         vMYXp3thaBIC/868HYKXgjO4gbNRT8khMm0/NO39dc3yZWDWiWOXLfMBm2mnysxxeCGK
         AewII6OCtiOBQql3aSWqEjFWZCLDlRoSYcU2m2My3dxGnLMcSwjwEYU/IBIrurbEpbi1
         lZBKrtMKepv7mIHEACdh1bgDq+kkB7PPe9a6WZwvGujEdwE7MINz/GNycYaOMeYZEKXx
         YafQ==
X-Gm-Message-State: ACgBeo0YoQnczD7pCmlr9x9yTiS0nYBODps7rX+BvCvsH+JO7w94BCdG
        g+yuJXzfxnHWk17s5OejQ1CqAuyvRPd5dq1C4lo=
X-Google-Smtp-Source: AA6agR5qwKkldsOR95XGvbtkAB2O9Mwd/1Y/pKoFJTvq65sd3Go0/YjkckRvGYFCO0Alrei9s0xxYA==
X-Received: by 2002:a05:6402:43c6:b0:43d:79a6:4e32 with SMTP id p6-20020a05640243c600b0043d79a64e32mr6857725edc.281.1661337963817;
        Wed, 24 Aug 2022 03:46:03 -0700 (PDT)
Received: from localhost ([2a02:8070:6389:a4c0:2ca9:6d59:782b:fff3])
        by smtp.gmail.com with ESMTPSA id e12-20020a056402330c00b00445f2dc2901sm2889216eda.21.2022.08.24.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 03:46:03 -0700 (PDT)
Date:   Wed, 24 Aug 2022 06:46:02 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     tj@kernel.org, mkoutny@suse.com, surenb@google.com,
        gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ
 pressure
Message-ID: <YwYBasgyIU0iQgL3@cmpxchg.org>
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
 <20220824081829.33748-8-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824081829.33748-8-zhouchengming@bytedance.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 24, 2022 at 04:18:26PM +0800, Chengming Zhou wrote:
> @@ -903,6 +903,36 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
>  	}
>  }
>  
> +#ifdef CONFIG_IRQ_TIME_ACCOUNTING
> +void psi_account_irqtime(struct task_struct *task, u32 delta)
> +{
> +	int cpu = task_cpu(task);
> +	void *iter = NULL;
> +	struct psi_group *group;
> +	struct psi_group_cpu *groupc;
> +	u64 now;
> +
> +	if (!task->pid)
> +		return;
> +
> +	now = cpu_clock(cpu);
> +
> +	while ((group = iterate_groups(task, &iter))) {
> +		groupc = per_cpu_ptr(group->pcpu, cpu);
> +
> +		write_seqcount_begin(&groupc->seq);
> +
> +		record_times(groupc, now);
> +		groupc->times[PSI_IRQ_FULL] += delta;
> +
> +		write_seqcount_end(&groupc->seq);
> +
> +		if (group->poll_states & (1 << PSI_IRQ_FULL))
> +			psi_schedule_poll_work(group, 1);
> +	}

Shouldn't this kick avgs_work too? If the CPU is otherwise idle,
times[PSI_IRQ_FULL] would overflow after two missed averaging runs.

avgs_work should probably also self-perpetuate when PSI_IRQ_FULL is in
changed_states. (Looking at that code, I think it can be simplified:
delete nonidle and do `if (changed_states) schedule_delayed_work()`.)
