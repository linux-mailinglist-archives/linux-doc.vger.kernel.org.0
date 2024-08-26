Return-Path: <linux-doc+bounces-23822-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C595F2A1
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 15:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E75E1C21CD6
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ADC185956;
	Mon, 26 Aug 2024 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MrHo6uOe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168AF17C98A
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678253; cv=none; b=a8B4lvahvCjMA9QzPHgpoFIyIc8oFGeTPQ3V0q9tI9lzyybLwL5YkUYdKriViuL3uANhspwEh8W+IBR/qCFMA4d2ke3QqD2J/I5ieTVNSbB17oBX4mJBnLWcLdjE0VClNQ0K9gX4WyCa5ZO64oEzHgjIcnBCDhJAyKytEVnxA2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678253; c=relaxed/simple;
	bh=JSH8SqpNQbSt6NhrXIE9u7Eh0AndPutbj+FZ/nav9j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGUCq3QC9hSuD8OzNygyjqiIlM1oV3YNWApZI3y7m4hwpbzOnsgLSMeDURuKR2JylKSfYtC8wOCbvekZxiELN8a18RO8Cdz3sHQgFRahgJ9pGIlYaaE1/xvWsI0paQ0OH9LTwcmuUIXBgwhEAN+8KszlFRsb468hUG+3d41K7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MrHo6uOe; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso29725181fa.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724678248; x=1725283048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQ6M5i9O8EydHcTNPBCvK0jtmZ3cgr0b0dzil6s4RI=;
        b=MrHo6uOelrxJxUdkkNWhKD1J064xyxBLfk6+8E1jusKYrR9J+WInIELUmBEplbAeB5
         HpWv+CQqiP7vsis+0FSncM2hd3wCjUscU4qB/5+VfRL8pJaVZ9IIaJ/Dxbi7FNGkTwvG
         NphTPOeEUXug7TuYPwyyECsftztYR/sf6eyDSrnzsKIGCuE8HHQUr4ZpKdk+Js4iILNh
         4Q8Jn9/lJ/Y/odEuquqLRlpJB4ETznFKUz+a8egpGsrDGRLwGB1hD/uojsKndSE6N+ZJ
         /B4wMBBkINbCSGh3J9rciTw/A2thFw3Bt54EnauuzDAgKv6liUTC+FKuemf8jh0wTCmy
         qw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724678248; x=1725283048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAQ6M5i9O8EydHcTNPBCvK0jtmZ3cgr0b0dzil6s4RI=;
        b=hZmt5MwYoAaI7XJfFxdnXMKS79j5QtiqsOK/xiMjop/juBDPM1HpdDUDtYxZWEIQCB
         GzCwwLo/wrkjIZIqVZ8HUzQ8mn0/1cMO6d5Jjad6Wb2DG9ZXVdVR5bVMX7yG6CrTb9Z/
         Hg45Pa3ffGmG/1d5cQOJiseQFxOUbUmrZfn46xzj/0CO2qkBMf/IKLG0yEGswAU7vS5P
         eau621VdHgD7fDkvgAZDyHRIDjsvQnmiNDiQBfNdNrwWBqRPsmHH3OPcmVYOQyE+Bh8Z
         PasCCLHw7ZnLAFPrn4rS3LxT3YXNegIyfndPDS4Q/gePO6VdECycdmhe7TGY3pCox2o0
         RWdg==
X-Forwarded-Encrypted: i=1; AJvYcCVh74Nuez98Uedte62yv4P2dLVMqn1pO6wHmsWIiAfLcoWP/BLbifhDlnzkoqvb36nLETTi8ycbv5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/zc+8uupok+ptNIc5+eqGL6U2H/Hgaf6t9IDTZN/ZBL915vJ
	jD9dKrHtsisFLQgLNGTW0eV7DfY6XwazdSZwGDL6D6i/wzPrwb5LYxxCt7Xme+0=
X-Google-Smtp-Source: AGHT+IF23h3rP35OdQrEVkqc47eRF5yl1OaSv9GaxlcrSNP3KudzCHntUQv44MhoMobTuNvYO7e7Lw==
X-Received: by 2002:a2e:71a:0:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2f4f493a108mr65127501fa.39.1724678248005;
        Mon, 26 Aug 2024 06:17:28 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddc6basm5590989a12.12.2024.08.26.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 06:17:27 -0700 (PDT)
Date: Mon, 26 Aug 2024 15:17:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Navneet Singh <navneet.singh@intel.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	linux-btrfs@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	nvdimm@lists.linux.dev
Subject: Re: [PATCH v3 02/25] printk: Add print format (%par) for struct range
Message-ID: <ZsyAZsDeWLNvSec9@pathway.suse.cz>
References: <20240816-dcd-type2-upstream-v3-0-7c9b96cba6d7@intel.com>
 <20240816-dcd-type2-upstream-v3-2-7c9b96cba6d7@intel.com>
 <ZsSjdjzRSG87alk5@pathway.suse.cz>
 <66c77b1c5c65c_1719d2940@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66c77b1c5c65c_1719d2940@iweiny-mobl.notmuch>

On Thu 2024-08-22 12:53:32, Ira Weiny wrote:
> Petr Mladek wrote:
> > On Fri 2024-08-16 09:44:10, Ira Weiny wrote:
> > > The use of struct range in the CXL subsystem is growing.  In particular,
> > > the addition of Dynamic Capacity devices uses struct range in a number
> > > of places which are reported in debug and error messages.
> > > 
> > > To wit requiring the printing of the start/end fields in each print
> > > became cumbersome.  Dan Williams mentions in [1] that it might be time
> > > to have a print specifier for struct range similar to struct resource
> > > 
> > > A few alternatives were considered including '%pn' for 'print raNge' but
> > > %par follows that struct range is most often used to store a range of
> > > physical addresses.  So use '%par' for 'print address range'.
> > > 
> > > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > > index 2d71b1115916..c132178fac07 100644
> > > --- a/lib/vsprintf.c
> > > +++ b/lib/vsprintf.c
> > > @@ -1140,6 +1140,39 @@ char *resource_string(char *buf, char *end, struct resource *res,
> > >  	return string_nocheck(buf, end, sym, spec);
> > >  }
> > >  
> > > +static noinline_for_stack
> > > +char *range_string(char *buf, char *end, const struct range *range,
> > > +		      struct printf_spec spec, const char *fmt)
> > > +{
> > > +#define RANGE_PRINTK_SIZE		16
> > > +#define RANGE_DECODED_BUF_SIZE		((2 * sizeof(struct range)) + 4)
> > > +#define RANGE_PRINT_BUF_SIZE		sizeof("[range - ]")

[...]

> > > +	static const struct printf_spec range_spec = {
> > > +		.base = 16,
> > > +		.field_width = RANGE_PRINTK_SIZE,
> 
> However, my testing indicates this needs to be.
> 
>                 .field_width = 18, /* 2 (0x) + 2 * 8 (bytes) */

Makes sense. Great catch!

> ... to properly zero pad the value.  Does that make sense?
>
> > > +		.precision = -1,
> > > +		.flags = SPECIAL | SMALL | ZEROPAD,
> > > +	};
> > > +
> > > +	*p++ = '[';
> > > +	p = string_nocheck(p, pend, "range ", str_spec);
> > > +	p = number(p, pend, range->start, range_spec);
> > > +	*p++ = '-';
> > > +	p = number(p, pend, range->end, range_spec);
> > > +	*p++ = ']';
> > > +	*p = '\0';

Best Regards,
Petr

