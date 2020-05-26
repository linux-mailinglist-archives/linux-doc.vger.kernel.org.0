Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831451C64FE
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 02:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgEFAWJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 May 2020 20:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgEFAWJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 20:22:09 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F58C061A10
        for <linux-doc@vger.kernel.org>; Tue,  5 May 2020 17:22:09 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m7so256718plt.5
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2020 17:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZvtFEnMi2NJUvYOA1hwzrk2/9S5POTyl8kbWV2Gm77s=;
        b=Zdz3xM+ELRXpwtak30Fv1xijJe4qxJHC2SV4aWG7BDk+yT4JmAW1WWkgyZwupaSQxp
         4gY9CuZXwkSbCLt47HLwSHMRm9z6EA/zuvXpth2ltBtV1JcsbdvUNtF4lnxzs21aZxmj
         qxtNLQurjkXFLAiIuOYlVEYA5Ez13CEKfKk3PSTZKLeE+MPBnAecfB5cGfO5hjxWBNNi
         yoAZKsMBB+4mBdk3ciERe8OUrLaSU8l+yL1flVMMmkwmbTdKg5ewjuJ0cmfFcZhszfSi
         oXcZHIvrLeQ9/5acB/GUdxk+cdniuX0BTm+jWKPTWokDGWvz7d2p3veNfdUVMGbtgmwq
         QaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZvtFEnMi2NJUvYOA1hwzrk2/9S5POTyl8kbWV2Gm77s=;
        b=Q/yWG8zVSt5lPneZzBfPzMfTM4t96g5aXyQvKnyUmkO8cZ6T4ZqPXuknANGXehSGV4
         ero5AsEd9bQQtnwT6AK3NE8XxVZNzrVdMCR0n9+p3KGPr2vtmO+rEUbXkIMzRf905H8b
         Jd9RjeWM+SOYdlWvUhBSKvnr9tF5waWqPLzwxZO97HXfLLlZ4vipnfu12/cPIZcbgbmt
         0Mgwt5gIW3xpcsaxIkZL/vQ7yyriNS7LFbMIwUXUiUhE9uXEcZ4P5sX9loiUw8oG8ZCu
         N5+mvLgWPFcp5fihN8inMhTP3psaXhOsmcym/RY9tnHE4KidAvQ9GzKWvm8cUUkZgfzN
         vt8A==
X-Gm-Message-State: AGi0PuYbMIOg/+QYEwztWoStBut7+/VHKxx4ifZfyUd2mqKPGLG9GH1+
        w0ECKyeBF/mHSErrgj3fdgMZEG45Uzc=
X-Google-Smtp-Source: APiQypKrpyWM/cE9eGe5PqG/T8X+yvyTi490sZ35cs6fo0Qm93IrH4omnzbdzSKt4dzFh7cLSNaoYg==
X-Received: by 2002:a17:90a:f404:: with SMTP id ch4mr6078272pjb.123.1588724528573;
        Tue, 05 May 2020 17:22:08 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x18sm21139pfi.22.2020.05.05.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:22:07 -0700 (PDT)
Date:   Tue, 5 May 2020 17:22:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] remoteproc: Add new operation and flags for
 synchronistation
Message-ID: <20200506002253.GC2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-4-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> Add a new sync_ops to support use cases where the remoteproc
> core is synchronising with the remote processor.  Exactly when to use
> the synchronisation operations is directed by the flags in structure
> rproc_sync_flags.
> 

I'm sorry, but no matter how many times I read these patches I have to
translate "synchronising" to "remote controlled", and given the number
of comments clarifying this makes me feel that we could perhaps come up
with a better name?

> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  include/linux/remoteproc.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ac4082f12e8b..ceb3b2bba824 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -353,6 +353,23 @@ enum rsc_handling_status {
>  	RSC_IGNORED	= 1,
>  };
>  
> +/**
> + * struct rproc_sync_flags - platform specific flags indicating which
> + *			      rproc_ops to use at specific times during
> + *			      the rproc lifecycle.
> + * @on_init: true if synchronising with the remote processor at
> + *	     initialisation time
> + * @after_stop: true if synchronising with the remote processor after it was
> + *		stopped from the cmmand line
> + * @after_crash: true if synchronising with the remote processor after
> + *		 it has crashed
> + */
> +struct rproc_sync_flags {
> +	bool on_init;

This indirectly splits the RPROC_OFFLINE state in an "offline" and
"already-booted" state. Wouldn't it be clearer to represent this with a
new RPROC_ALREADY_BOOTED state?

> +	bool after_stop;

What does it mean when this is true? That Linux can shut the remote core
down, but someone else will start it?

> +	bool after_crash;

Similarly what is the expected steps to be taken by the core when this
is true? Should rproc_report_crash() simply stop/start the subdevices
and upon one of the ops somehow tell the remote controller that it can
proceed with the recovery?

> +};
> +
>  /**
>   * struct rproc_ops - platform-specific device handlers
>   * @start:	power on the device and boot it
> @@ -459,6 +476,9 @@ struct rproc_dump_segment {
>   * @firmware: name of firmware file to be loaded
>   * @priv: private data which belongs to the platform-specific rproc module
>   * @ops: platform-specific start/stop rproc handlers
> + * @sync_ops: platform-specific start/stop rproc handlers when
> + *	      synchronising with a remote processor.
> + * @sync_flags: Determine the rproc_ops to choose in specific states.
>   * @dev: virtual device for refcounting and common remoteproc behavior
>   * @power: refcount of users who need this rproc powered up
>   * @state: state of the device
> @@ -482,6 +502,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @sync_with_rproc: true if currently synchronising with the rproc
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   */
> @@ -492,6 +513,8 @@ struct rproc {
>  	const char *firmware;
>  	void *priv;
>  	struct rproc_ops *ops;
> +	struct rproc_ops *sync_ops;

Do we really need two rproc_ops, given that both are coming from the
platform driver and the sync_flags will define which one to look at?

Can't the platform driver just provide an ops table that works with the
flags it passes?

Regards,
Bjorn

> +	struct rproc_sync_flags sync_flags;
>  	struct device dev;
>  	atomic_t power;
>  	unsigned int state;
> @@ -515,6 +538,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool sync_with_rproc;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> -- 
> 2.20.1
> 
