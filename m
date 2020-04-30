Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260A41C0898
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2020 22:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgD3Uvt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Apr 2020 16:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726338AbgD3Uvs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 16:51:48 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4F0C08E859
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 13:51:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s18so3454249pgl.12
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 13:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z/T+sqjzriwApQPNZZiP/b1FdETZszA1CYwNdpGLAcw=;
        b=NP2qv5b+jPWNia/NbPWik2u7QNt3CPH39cpq5jmaPXD5hlUnZTgj946oxqA0XZBcmT
         Dd5AvKrs76qyF6sQNkqlTqLgTAhO6QrUJ1ySM+wuzaHfowQhvrbJfBFzFffjcxiqJuAL
         x0eDANLjWuPqo5cySfLNcjAdGzQ3Kesulvrin4uoFOBGvsR2xNHSGvncJiG70chn84pN
         pXeFekkfkuCwIl30ZuWITGr0o36iYOWxw4ubIvmxdlTa2rD8yEhCyiVhD1XEZbUZkUMn
         /8+P6IPrcg4piPhOlP52LxjVpOxq6fXRXhAr6sjXtQVtHmElAwhu/XDWqhAaKWGRBjCD
         v+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z/T+sqjzriwApQPNZZiP/b1FdETZszA1CYwNdpGLAcw=;
        b=uZOos4VlX8HZloM8XroK+Zd8dYse9nxevI2ipw56PjImn2t8Y4sfZNkA0CqIfJvRvY
         /IS1PmgJPvlQ95QMmU+AD8ZPAsGIqeNDHJz9qYsgbV2knq3PQaiJvj25Xk9smLTXqFgA
         17mWsrmteubtim6oDIfaaGEPXMr/lcSrW1zNXCVTO5DFbzXvj8govVtjFVwqwbYoOYbU
         Rsp4Bv8e360sVN3nvXB1Y5ojwGqDgmxm4hysIs8L50bCZNAwFOCZPQADEpTkO7aV+ApY
         gZH0L4bfU/tm0z9wXXOWrBiSgOrR7dvBBTZwrW8RmC5Ap0cG77hBtI2oJ7UD6nkUqpst
         tz5Q==
X-Gm-Message-State: AGi0Pua1hEW+65q5VhpokMZ5oX9ecmX23BXfBwe7EImAmAM/5ZC3/jHH
        icCwzhiCx5u3z8/2RBpKD7ISXQ==
X-Google-Smtp-Source: APiQypIt+nZ0EnewUCudryVsUwv9nKND70SWKh1DFcVyMYgdcQGYHTWepdgAJg+wXKWv/u59zo0Baw==
X-Received: by 2002:a63:3d43:: with SMTP id k64mr825299pga.150.1588279905969;
        Thu, 30 Apr 2020 13:51:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id fy21sm548254pjb.25.2020.04.30.13.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 13:51:45 -0700 (PDT)
Date:   Thu, 30 Apr 2020 14:51:43 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/14] remoteproc: Introducing function
 rproc_set_state_machine()
Message-ID: <20200430205143.GC18004@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-13-mathieu.poirier@linaro.org>
 <d297aeab-4f7e-95e0-04c0-266e0f08b2d0@st.com>
 <1438e3f6-3d8a-7edd-f552-b01f84316ec7@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438e3f6-3d8a-7edd-f552-b01f84316ec7@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 29, 2020 at 04:38:54PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/29/20 11:22 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> >> Introducting function rproc_set_state_machine() to add
> >> operations and a set of flags to use when synchronising with
> >> a remote processor.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     | 54 ++++++++++++++++++++++++
> >>  drivers/remoteproc/remoteproc_internal.h |  6 +++
> >>  include/linux/remoteproc.h               |  3 ++
> >>  3 files changed, 63 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 48afa1f80a8f..5c48714e8702 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -2065,6 +2065,59 @@ int devm_rproc_add(struct device *dev, struct rproc *rproc)
> >>  }
> >>  EXPORT_SYMBOL(devm_rproc_add);
> >>  
> >> +/**
> >> + * rproc_set_state_machine() - Set a synchronisation ops and set of flags
> >> + *			       to use with a remote processor
> >> + * @rproc:	The remote processor to work with
> >> + * @sync_ops:	The operations to use when synchronising with a remote
> >> + *		processor
> >> + * @sync_flags:	The flags to use when deciding if the remoteproc core
> >> + *		should be synchronising with a remote processor
> >> + *
> >> + * Returns 0 on success, an error code otherwise.
> >> + */
> >> +int rproc_set_state_machine(struct rproc *rproc,
> >> +			    const struct rproc_ops *sync_ops,
> >> +			    struct rproc_sync_flags sync_flags)
> > 
> > So this API should be called by platform driver only in case of synchronization
> > support, right?
> > In this case i would rename it as there is also a state machine in "normal" boot
> > proposal: rproc_set_sync_machine or rproc_set_sync_state_machine
> > 
> 
> Reviewing the stm32 series, i wonder if sync_flags should be a pointer to a const structure
> as the platform driver should not update it during the rproc live cycle.
> Then IMO, using a pointer to the structure instead of the structure seems more 
> in line with the rest of the remoteproc API.

Humm... If we do make sync_flags constant then the platform drivers can't modify
the values dynamically, as I did in the stm32 series.  This is something Loic
had asked for.

Moreover function rproc_set_state_machine() can't be called twice so updating
the sync_flags can't happen.

> 
> >> +{
> >> +	if (!rproc || !sync_ops)
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * No point in going further if we never have to synchronise with
> >> +	 * the remote processor.
> >> +	 */
> >> +	if (!sync_flags.on_init &&
> >> +	    !sync_flags.after_stop && !sync_flags.after_crash)
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * Refuse to go further if remoteproc operations have been allocated
> >> +	 * but they will never be used.
> >> +	 */
> >> +	if (rproc->ops && sync_flags.on_init &&
> >> +	    sync_flags.after_stop && sync_flags.after_crash)
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * Don't allow users to set this more than once to avoid situations
> >> +	 * where the remote processor can't be recovered.
> >> +	 */
> >> +	if (rproc->sync_ops)
> >> +		return -EINVAL;
> >> +
> >> +	rproc->sync_ops = kmemdup(sync_ops, sizeof(*sync_ops), GFP_KERNEL);
> >> +	if (!rproc->sync_ops)
> >> +		return -ENOMEM;
> >> +
> >> +	rproc->sync_flags = sync_flags;
> >> +	/* Tell the core what to do when initialising */
> >> +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_INIT);
> > 
> > Is there a use case where sync_flags.on_init is false and other flags are true?
> > 
> > Look like on_init is useless and should not be exposed to the platform driver.
> > Or comments are missing to explain the usage of it vs the other flags.
> > 
> > Regards,
> > Arnaud
> >  
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(rproc_set_state_machine);
> >> +
> >>  /**
> >>   * rproc_type_release() - release a remote processor instance
> >>   * @dev: the rproc's device
> >> @@ -2088,6 +2141,7 @@ static void rproc_type_release(struct device *dev)
> >>  	kfree_const(rproc->firmware);
> >>  	kfree_const(rproc->name);
> >>  	kfree(rproc->ops);
> >> +	kfree(rproc->sync_ops);
> >>  	kfree(rproc);
> >>  }
> >>  
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 7dcc0a26892b..c1a293a37c78 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -27,6 +27,8 @@ struct rproc_debug_trace {
> >>  /*
> >>   * enum rproc_sync_states - remote processsor sync states
> >>   *
> >> + * @RPROC_SYNC_STATE_INIT	state to use when the remoteproc core
> >> + *				is initialising.
> >>   * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> >>   *				has shutdown (rproc_shutdown()) the
> >>   *				remote processor.
> >> @@ -39,6 +41,7 @@ struct rproc_debug_trace {
> >>   * operation to use.
> >>   */
> >>  enum rproc_sync_states {
> >> +	RPROC_SYNC_STATE_INIT,
> >>  	RPROC_SYNC_STATE_SHUTDOWN,
> >>  	RPROC_SYNC_STATE_CRASHED,
> >>  };
> >> @@ -47,6 +50,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
> >>  				       enum rproc_sync_states state)
> >>  {
> >>  	switch (state) {
> >> +	case RPROC_SYNC_STATE_INIT:
> >> +		rproc->sync_with_rproc = rproc->sync_flags.on_init;
> >> +		break;
> >>  	case RPROC_SYNC_STATE_SHUTDOWN:
> >>  		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
> >>  		break;
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index ceb3b2bba824..a75ed92b3de6 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -619,6 +619,9 @@ struct rproc *rproc_get_by_child(struct device *dev);
> >>  struct rproc *rproc_alloc(struct device *dev, const char *name,
> >>  			  const struct rproc_ops *ops,
> >>  			  const char *firmware, int len);
> >> +int rproc_set_state_machine(struct rproc *rproc,
> >> +			    const struct rproc_ops *sync_ops,
> >> +			    struct rproc_sync_flags sync_flags);
> >>  void rproc_put(struct rproc *rproc);
> >>  int rproc_add(struct rproc *rproc);
> >>  int rproc_del(struct rproc *rproc);
> >>
