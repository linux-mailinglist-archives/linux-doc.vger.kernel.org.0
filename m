Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9551D1BD707
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2020 10:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2IUA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Apr 2020 04:20:00 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:2744 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726401AbgD2IUA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Apr 2020 04:20:00 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03T8IO2b008318;
        Wed, 29 Apr 2020 10:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kh9mI6iI8L2CCPZQf+hUfsok0U0KKNtrTH/6b6Bxu6g=;
 b=qI4ZM1SmVgLG09SAZGOGcwJfhG8SijosBrQQRTTvAdxbZqoefSG7hb6ySMXC66g4qqd5
 hMBEBwmc7acWnuwh5BaRf9XIBOALbYBXnErakE7UZytcpjiXbEeoukYP7NY7Wy3p1Aqn
 uX06duOp8PHNd/nsGvmu6PqzPa5WmgAivHxFfSOSNhJu6IKuzetjN1zscymVZL6T0LJ9
 PpNaxddE25yXBodjNgEO1sdJ3u/iZ0F6ozP9jELkkHDUDVJl5kKBG4xrxC9BNZkm8ze5
 +7h8VEdtBgvU42S38fkb4lYJQmhp9qRrinXOHpm0VQC8CE11/joale7SCemnGNYJR8eo gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30mhcc4ypq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Apr 2020 10:19:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 489DA10002A;
        Wed, 29 Apr 2020 10:19:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 366182073B2;
        Wed, 29 Apr 2020 10:19:51 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 10:19:50 +0200
Subject: Re: [PATCH v3 10/14] remoteproc: Deal with synchronisation when
 shutting down
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>, <ohad@wizery.com>
CC:     <loic.pallardy@st.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-11-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <d2eeb480-6ba1-de12-53ba-cdf9c61b94b0@st.com>
Date:   Wed, 29 Apr 2020 10:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424200135.28825-11-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-29_02:2020-04-28,2020-04-29 signatures=0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> The remoteproc core must not allow function rproc_shutdown() to
> proceed if currently synchronising with a remote processor and
> the synchronisation operations of that remote processor does not
> support it.  Also part of the process is to set the synchronisation
> flag so that the remoteproc core can make the right decisions when
> restarting the system.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |  7 ++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3a84a38ba37b..48afa1f80a8f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1849,6 +1849,27 @@ int rproc_boot(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_boot);
>  
> +static bool rproc_can_shutdown(struct rproc *rproc)
> +{
> +	/*
> +	 * The remoteproc core is the lifecycle manager, no problem
> +	 * calling for a shutdown.
> +	 */
> +	if (!rproc_needs_syncing(rproc))
> +		return true;
> +
> +	/*
> +	 * The remoteproc has been loaded by another entity (as per above
> +	 * condition) and the platform code has given us the capability
> +	 * of stopping it.
> +	 */
> +	if (rproc->sync_ops->stop)
> +		return true;

This means that if rproc->sync_ops->stop is null rproc_stop_subdevices will not
be called? seems not symmetric with the start sequence.
Probably not useful to test it here as condition is already handled in rproc_stop_device...

Regards
Arnaud
> +
> +	/* Any other condition should not be allowed */
> +	return false;
> +}
> +
>  /**
>   * rproc_shutdown() - power off the remote processor
>   * @rproc: the remote processor
> @@ -1879,6 +1900,9 @@ void rproc_shutdown(struct rproc *rproc)
>  		return;
>  	}
>  
> +	if (!rproc_can_shutdown(rproc))
> +		goto out;
> +
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
> @@ -1898,6 +1922,14 @@ void rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +
> +	/*
> +	 * The remote processor has been switched off - tell the core what
> +	 * operation to use from hereon, i.e whether an external entity will
> +	 * reboot the remote processor or it is now the remoteproc core's
> +	 * responsability.
> +	 */
> +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_SHUTDOWN);
>  out:
>  	mutex_unlock(&rproc->lock);
>  }
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 61500981155c..7dcc0a26892b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -27,6 +27,9 @@ struct rproc_debug_trace {
>  /*
>   * enum rproc_sync_states - remote processsor sync states
>   *
> + * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> + *				has shutdown (rproc_shutdown()) the
> + *				remote processor.
>   * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
>   *				has crashed but has not been recovered by
>   *				the remoteproc core yet.
> @@ -36,6 +39,7 @@ struct rproc_debug_trace {
>   * operation to use.
>   */
>  enum rproc_sync_states {
> +	RPROC_SYNC_STATE_SHUTDOWN,
>  	RPROC_SYNC_STATE_CRASHED,
>  };
>  
> @@ -43,6 +47,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
>  				       enum rproc_sync_states state)
>  {
>  	switch (state) {
> +	case RPROC_SYNC_STATE_SHUTDOWN:
> +		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
> +		break;
>  	case RPROC_SYNC_STATE_CRASHED:
>  		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
>  		break;
> 
