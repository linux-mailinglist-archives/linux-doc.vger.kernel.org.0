Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309761CB7EF
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2020 21:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgEHTJQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 May 2020 15:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726797AbgEHTJP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 May 2020 15:09:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF4EC05BD0A
        for <linux-doc@vger.kernel.org>; Fri,  8 May 2020 12:09:15 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so1433277pfg.2
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2020 12:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZrRyPpzm1Wr0bdkc0wF86Fld8NZLrNeACvycZ1kw4os=;
        b=OLu8LUoFVM4oyCO5AtdtrepqMY8xQbLSJpJJcQlFFZNX9jHCjTCYsLjYxZcFFHRw1h
         jnxD+/nCldbnNrvNS2uXXQ9cf1cy/nnZzmPmiVZqBrW7i0WAqkI2OZsshLDogZMFwNZw
         QTkG7bLpXZVdUAg7aEXHdJRvhLTqkKcKg4GbCeXt9QP/uQbXNz8VWBWvJFOksrqfmg1U
         SisWOlad75CG2Vlm0b2CibuOOnvPDF23pQTQdJkCcI7nLBMu1/hXtYoPYkhkKkCZhLL2
         +3sn/BMyYSNDPBPu6y15ZJELAa5l5fFG0j48OtT/ZmvHXn5fo98ji78NTABy74yI3TPD
         ugcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZrRyPpzm1Wr0bdkc0wF86Fld8NZLrNeACvycZ1kw4os=;
        b=NlSlm1hRser8ZRh49jMXjUeaFaedHFK1oYJ9rQbp6AJNg2qhIK0PzRTRoQ7WSa73Nt
         t8lGClS3gpj5tjNCRUDi6TBBky/6XXateSb3FTvqfmc+r5n43LSsCKkw/DrW6a66Vjhi
         SD0Ib0+MLW6umY2Rdoan2CvIPNBw0MH/SY+vXXL+mrW/5YQp/TCNCgAKEMEyt/mHuYWb
         TWV9euPePnARBaTyCOwLIxmSMiUwcoumfoXBW/4qhGShrIYnA5uKoWADpSIi65dw4fL7
         G4MuPd88leh8eXVIUMIVsQcOzunQKER7UdErOeXY8IFklB5WFs5MK6cElJFSfF8iJPe8
         ZV/g==
X-Gm-Message-State: AGi0PuYyX/NtxqC/kdDNYb/pSyJnlc4dtmzYG2AEnrORTkWlrfBvxCkX
        Y/WM6QSQNg7BzIGNwyM0KjE7wA==
X-Google-Smtp-Source: APiQypK300/hKC35oHTBAMQmgp/mTdcuz3tlQk4JcQD3R2+iSFiayTznCchz0upseoQJpTyBhNQ2vQ==
X-Received: by 2002:a63:dd11:: with SMTP id t17mr2785704pgg.348.1588964954846;
        Fri, 08 May 2020 12:09:14 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id h11sm2407257pfo.120.2020.05.08.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:09:13 -0700 (PDT)
Date:   Fri, 8 May 2020 13:09:11 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/14] remoteproc: Make core operations optional
Message-ID: <20200508190911.GA4526@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-2-mathieu.poirier@linaro.org>
 <20200505221608.GA2329931@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505221608.GA2329931@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Bjorn,

On Tue, May 05, 2020 at 03:16:08PM -0700, Bjorn Andersson wrote:
> On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> 
> > When synchronizing with a remote processor, it is entirely possible that
> > the remoteproc core is not the life cycle manager.  In such a case core
> > operations don't exist and should not be called.
> > 
> 
> Why would the core call these functions if it knows the remote is in a
> state where it doesn't need these?

This is the reasoning that came out of a conversation Arnaud and I had.  We are
all on the same page.

> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_internal.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index b389dc79da81..59fc871743c7 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -67,7 +67,7 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->sanity_check)
> > +	if (rproc->ops && rproc->ops->sanity_check)
> >  		return rproc->ops->sanity_check(rproc, fw);
> >  
> >  	return 0;
> > @@ -76,7 +76,7 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->get_boot_addr)
> > +	if (rproc->ops && rproc->ops->get_boot_addr)
> >  		return rproc->ops->get_boot_addr(rproc, fw);
> >  
> >  	return 0;
> > @@ -85,7 +85,7 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->load)
> > +	if (rproc->ops && rproc->ops->load)
> >  		return rproc->ops->load(rproc, fw);
> >  
> >  	return -EINVAL;
> > @@ -93,7 +93,7 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  
> >  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->parse_fw)
> > +	if (rproc->ops && rproc->ops->parse_fw)
> >  		return rproc->ops->parse_fw(rproc, fw);
> >  
> >  	return 0;
> > @@ -103,7 +103,7 @@ static inline
> >  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
> >  		     int avail)
> >  {
> > -	if (rproc->ops->handle_rsc)
> > +	if (rproc->ops && rproc->ops->handle_rsc)
> >  		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
> >  					      avail);
> >  
> > @@ -114,7 +114,7 @@ static inline
> >  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  						   const struct firmware *fw)
> >  {
> > -	if (rproc->ops->find_loaded_rsc_table)
> > +	if (rproc->ops && rproc->ops->find_loaded_rsc_table)
> >  		return rproc->ops->find_loaded_rsc_table(rproc, fw);
> >  
> >  	return NULL;
> > -- 
> > 2.20.1
> > 
