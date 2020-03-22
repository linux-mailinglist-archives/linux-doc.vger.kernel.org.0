Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E50418E990
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2020 16:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgCVPQG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 22 Mar 2020 11:16:06 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38855 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCVPQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Mar 2020 11:16:05 -0400
Received: by mail-pf1-f193.google.com with SMTP id z25so1816948pfa.5
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2020 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6dpw9rDwVFF+jBSqqps/Fz65ini0gev9EsYNdaUAAOw=;
        b=cI3Ojtue1abNbnhEXHj2iryE86swUOebT5p/+8RCaO5uNSnhQ9Y7TVRjkqQM9VLRFP
         dJv9sDMVYKxFQa0rCrirVl8449WdxPXtbt8AiVGom/vRGCQjpA1SrRhdc4HdrJ8NCERe
         BzLIan9hI5+ldnBF53MPXrWaJDzIME7aEKxgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6dpw9rDwVFF+jBSqqps/Fz65ini0gev9EsYNdaUAAOw=;
        b=H5pmPqUKHCHaYPx0nZeoKrDjBn71U52vt9+t28HOPDsiUu1cX6X4KfE/PO5U4aJTp+
         gTMixJ74ZxXh1GGWvC7WqtOSbOZPucJZzx0fmTNFhI2ndop3Lqz5VrIFHwSoAH7HDEhp
         tLvHh9GgT2Tgo6yLk73lDmKkcHIezvoDQmuigM1wF0IwuaiGA/3rTppk7gFQH9FzzWKT
         EtJgELyXNmF1Mdi3D4ejn+7YNjxrD5SOsQZ9OoN1tkduUgcW7PXbrJgvSQN9eW+8ozXR
         FvcST+TKeKD4K21xbTSt9jr9Gh8IhAKkiJuKqJG/9GtXxJnAeDozmWGU4ldZ3uDrsbcK
         7f7w==
X-Gm-Message-State: ANhLgQ0z6PPHh/30a7jHiw5c6DEAmzZrnKFZ8/TiSe3jxmJrVgzj4P45
        qGkL8lmITiJKle9aID+Een/iEg==
X-Google-Smtp-Source: ADFU+vuWKzy086D5ElUKvJfnJKYW2BQ4xV1n4gXNC8LIJaIR7+nZmnQmmYjnlO8aEfT/1OxfgJL/Cg==
X-Received: by 2002:a63:ff0d:: with SMTP id k13mr8595652pgi.376.1584890163299;
        Sun, 22 Mar 2020 08:16:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 11sm10770850pfz.91.2020.03.22.08.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 08:16:02 -0700 (PDT)
Date:   Sun, 22 Mar 2020 08:16:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/11] pstore/blk: blkoops: support ftrace recorder
Message-ID: <202003220814.713B5DF7AA@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-6-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181117.6EA5486@keescook>
 <42205dc0-f001-bbf0-00b6-85aca0cdb1f8@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42205dc0-f001-bbf0-00b6-85aca0cdb1f8@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 22, 2020 at 07:42:07PM +0800, WeiXiong Liao wrote:
> On 2020/3/19 AM 2:19, Kees Cook wrote:
> > On Fri, Feb 07, 2020 at 08:25:49PM +0800, WeiXiong Liao wrote:
> >> +static int blkz_recover_zones(struct blkz_context *cxt,
> >> +		struct blkz_zone **zones, unsigned int cnt)
> >> +{
> >> +	int ret;
> >> +	unsigned int i;
> >> +	struct blkz_zone *zone;
> >> +
> >> +	if (!zones)
> >> +		return 0;
> >> +
> >> +	for (i = 0; i < cnt; i++) {
> >> +		zone = zones[i];
> >> +		if (unlikely(!zone))
> >> +			continue;
> >> +		ret = blkz_recover_zone(cxt, zone);
> >> +		if (ret)
> >> +			goto recover_fail;
> >> +	}
> >> +
> >> +	return 0;
> >> +recover_fail:
> >> +	pr_debug("recover %s[%u] failed\n", zone->name, i);
> >> +	return ret;
> >> +}
> > 
> > Why is this introduced here? Shouldn't this be earlier in the series?
> 
> blkz_recover_zones() is used to recover a array of zones. Only ftrace
> recorder need it, so it's introduced here.

Okay, that's fine. I thought maybe the dmesg front-end could use it too?
Anyway, I can look at it again in v3. :)

-- 
Kees Cook
