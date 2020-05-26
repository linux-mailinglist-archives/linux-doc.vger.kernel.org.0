Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF611CEC5A
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 07:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgELFPO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 May 2020 01:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725776AbgELFPN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 May 2020 01:15:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBE7C061A0E
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 22:15:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id p25so5789835pfn.11
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 22:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hkw/Z63xQHG8uMp0IH/cCnzDA8TYdvaGr2m+4SY43mQ=;
        b=NxeO0LEOxjSFPTHG2C8P6nGRpFSnOQS4nM0rEMQT5Qmce3eP8ATPEFQ5t6N0YnCvl8
         uXPC4uUm7iPJ23kuR7NeQ4LaqrZf6uLqsdv01pHYCOWKmjyZkdJs4+ayMsSqDgwMW4Al
         okZIIW6hD7YscBdv3SDXPH1XadUmgOOLWh5As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkw/Z63xQHG8uMp0IH/cCnzDA8TYdvaGr2m+4SY43mQ=;
        b=ApxTdwXFkiU/tNYigvGD7AGQ3lsMns9yaSvJIBnIkt1NU0cHerseP1gv0XVHX9FN5b
         BcaATncWHEs4ICk68H1437n5UTqURu1bsl09RQ1xYDp23L7EIcnzDxQWL50Xe4b8VLLA
         Nq7XIoIzylQlOGgPRJ0UOm4qa8u4HBsrmb+ZYLg75o62ZsQZg5k1/OgWJpuX3ZCF7z8+
         lWJZ6cfh0b64uQPXan0QT5v8gnHpHurSjVEuqCsTKg2OsJX+NLirN4ly1g5pFBz766lt
         wV9zZ/vuP9kDrpATNxdfIV88IZBsjyeNcbOvQqp7hUBo2hut7WsVd+OLxV8P8rvFByZ8
         FHug==
X-Gm-Message-State: AGi0PuZ7GRi6syjaaiz83hNIpYWAixSslERD5uP2DXkaXzmA20LA4WzS
        8QRIjyTDcj7ok6NLRnpOt3kBqA==
X-Google-Smtp-Source: APiQypLHR8TY4hZJxKV8zGV9lZbtbRZMhdgZf2g/71c4CVlnO4S4AhYYCUHD5RLGcmuTYmodJ37Qhw==
X-Received: by 2002:a63:4665:: with SMTP id v37mr17003825pgk.297.1589260512040;
        Mon, 11 May 2020 22:15:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t188sm10768564pfb.185.2020.05.11.22.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 22:15:11 -0700 (PDT)
Date:   Mon, 11 May 2020 22:15:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v8 01/11] pstore/zone: Introduce common layer to manage
 storage zones
Message-ID: <202005112212.2E75B83@keescook>
References: <20200511233229.27745-1-keescook@chromium.org>
 <20200511233229.27745-2-keescook@chromium.org>
 <a9d47bf1-7498-1d07-a943-29dd0b0ef2e1@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9d47bf1-7498-1d07-a943-29dd0b0ef2e1@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 12, 2020 at 11:55:20AM +0800, WeiXiong Liao wrote:
> On 2020/5/12 AM 7:32, Kees Cook wrote:
> > [...]
> > +struct psz_context {
> > +	struct pstore_zone **kpszs;
> > +	unsigned int kmsg_max_cnt;
> > +	unsigned int kmsg_read_cnt;
> > +	unsigned int kmsg_write_cnt;
> > +	/*
> > +	 * These counters should be calculated during recovery.
> > +	 * It records the oops/panic times after crashes rather than boots.
> > +	 */
> > +	unsigned int oops_counter;
> > +	unsigned int panic_counter;
> 
> oops/panic_counter is designed to count the crash times since the
> linux kernel was installed. pstore/zone lookup the max counter from all
> valid kmsg zones when recovery and saves them to oops/panic_counter.
> However, they are unable to get real number if we remove files. It's
> not serious, we can fix it after this series.

Since the kernel was installed? I don't see a kernel version check in
here? Or do you mean "since ever", in that it's a rolling count?

> And since pstore supports "max_reason", should pstore/zone count for
> other reason?

For now, no. I opted to try to keep this as simple as possible a port
from dump_oops to max_reason for now.

> > +static inline int psz_kmsg_erase(struct psz_context *cxt,
> > +		struct pstore_zone *zone, struct pstore_record *record)
> > +{
> > +	struct psz_buffer *buffer = zone->buffer;
> > +	struct psz_kmsg_header *hdr =
> > +		(struct psz_kmsg_header *)buffer->data;
> > +
> > +	if (unlikely(!psz_ok(zone)))
> > +		return 0;
> > +	/* this zone is already updated, no need to erase */
> > +	if (record->count != hdr->counter)
> > +		return 0;
> 
> These codes is to fix bug that user remove files on pstore filesystem
> but kmsg zone is already updated and pstore/zone should not erase
> zone. It work for oops and panic because the count number is increasing.
> However, it's useless for other reason of kmsg. We can fix it after this
> series.

Okay, sounds good.

-- 
Kees Cook
