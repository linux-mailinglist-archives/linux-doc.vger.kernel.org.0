Return-Path: <linux-doc+bounces-23341-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD09588B3
	for <lists+linux-doc@lfdr.de>; Tue, 20 Aug 2024 16:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC2C2867C0
	for <lists+linux-doc@lfdr.de>; Tue, 20 Aug 2024 14:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DE0191F61;
	Tue, 20 Aug 2024 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gOMq2qEV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89042190670
	for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2024 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724162941; cv=none; b=iDBUty3ph7BH3PcnnGxFR2NRSa59j4DtxrA8rn0BQq7yh3ZqW43bFkxK6oEc7jOi7A6U9wmm4iFWSNx7QdydIr0d73JAR5Jd6XphfgT6psnbE+NRv2TURoCBH3Pj03dl1I2Xchw01t9fYU4QM6dTodqmGZLNnXR77fKkKEsvI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724162941; c=relaxed/simple;
	bh=9Segk2rEnzzYLM5UMH/BUuLN5VWq274pJxTiMZnvWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNAZfrqJkfTaquf4zFR1VND7ZG8GAy01SP5ZAGuiwx19t7dLzeuI8I9bl/bvWSumH5Xdo1PNGYjZukSkplDF73WS92j4ti0zXTkJTA8ZfU7rOchTBwvfi6k88gSB2y6k/WzhSeQ2nPLrX8wEfZcrDqQcLzbx8Xh3Aoq8NBLHsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gOMq2qEV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso4557590a12.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2024 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724162937; x=1724767737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otzLQkR0nYuxuHzAtdMQ6ZUKW9N3q5AeXiTB9RXH6Zg=;
        b=gOMq2qEVQol0KrNDknOlChitHDcMJqAlli461k/USjC1apb918C/F5aO7mrAue5UV0
         JSzB/mdiNjFb30HeQxCcM52vRNQBF1QiSNe4VnFpvOlb65agi9xtDl9uYIoJ+1kH3m9I
         3VKgoor7GMXGNN7tbaQL7WrkxJZ1girXM8ojeeDjr1+PQQJNLwhurn53l8awsgugBxHU
         y413Z7VDJU7xRDW9Caawp8aUUS6YGWJrtVob3juCZ3ijqsKcmLOMFsJuC4//JkAizsqM
         g3KU+QI4arCi7qkUXysdF6vDYT3uE8fElXOb9dreAsND+b5WIGqQDMZTAiquIEUMSgUg
         Fn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724162937; x=1724767737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otzLQkR0nYuxuHzAtdMQ6ZUKW9N3q5AeXiTB9RXH6Zg=;
        b=gsiXQT/fBg1csEq5i5gKAgbDIfE6w+OtuNAv+Kz325GsHf9bQQW8aQnOgrcXMcuUG9
         8wbjwZ57u18zeHeufkbocfXb5o2O3XNzr0EjCbGPk+XIygjV2mLgHV+4STu6CwLU+69o
         Hv2/7zLT0ZrEMsekkT+FZ+Sfb9V2zY5oxKXqsxutqkbh0zFwHNPX1Rs+XunvDtQsQuDY
         JLZhq6MMBWD/EOUCzT/2aXFe++Sda9CvKJICFUpbuG/Wp4uL9VP1EFitDA54xvOKxfYB
         uU6zwAVRcKOvTWYJkR4Bg9KDhLqs4Gj+Z4d+Hh3RZgum2b+C8tX1fLAEqcD1AoOiyMtB
         KLqA==
X-Forwarded-Encrypted: i=1; AJvYcCWPS0PI9Z9+4ih7AGCdbItxhqKkPCoBCeIRr5YgV96Ha7VrZGHMs0Rgc8zPIUpcif7PeCOry0Pfmmhf6wWxMkHSvXwPgC/aIkyC
X-Gm-Message-State: AOJu0YyMh3RNBYEBCo5ncondpl1ceK9O0v9iopZBm5ityHnRWPQ4+OL/
	U632slRAbj3doQ64AgyiwvSRmo7zhXeKk/oco8TMqP8q4+77w9ZhZHuvslbn+zU=
X-Google-Smtp-Source: AGHT+IG7K42OljGwNDca7BpbBxc9a8ncIPw07BdbgCTDcGsV9LoXCrbLowXk7thOJpwhbZD0g4Oa7w==
X-Received: by 2002:aa7:c54d:0:b0:5a4:6dec:cd41 with SMTP id 4fb4d7f45d1cf-5beca76e4ebmr8107111a12.28.1724162936808;
        Tue, 20 Aug 2024 07:08:56 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbdfad42sm6871687a12.47.2024.08.20.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:08:56 -0700 (PDT)
Date: Tue, 20 Aug 2024 16:08:54 +0200
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
Message-ID: <ZsSjdjzRSG87alk5@pathway.suse.cz>
References: <20240816-dcd-type2-upstream-v3-0-7c9b96cba6d7@intel.com>
 <20240816-dcd-type2-upstream-v3-2-7c9b96cba6d7@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816-dcd-type2-upstream-v3-2-7c9b96cba6d7@intel.com>

On Fri 2024-08-16 09:44:10, Ira Weiny wrote:
> The use of struct range in the CXL subsystem is growing.  In particular,
> the addition of Dynamic Capacity devices uses struct range in a number
> of places which are reported in debug and error messages.
> 
> To wit requiring the printing of the start/end fields in each print
> became cumbersome.  Dan Williams mentions in [1] that it might be time
> to have a print specifier for struct range similar to struct resource
> 
> A few alternatives were considered including '%pn' for 'print raNge' but
> %par follows that struct range is most often used to store a range of
> physical addresses.  So use '%par' for 'print address range'.
> 
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -231,6 +231,20 @@ width of the CPU data path.
>  
>  Passed by reference.
>  
> +Struct Range
> +------------
> +
> +::
> +
> +	%par	[range 0x60000000-0x6fffffff] or

It seems that it is always 64-bit. It prints:

struct range {
	u64   start;
	u64   end;
};

> +		[range 0x0000000060000000-0x000000006fffffff]
> +
> +For printing struct range.  A variation of printing a physical address is to
> +print the value of struct range which are often used to hold a physical address
> +range.
> +
> +Passed by reference.
> +
>  DMA address types dma_addr_t
>  ----------------------------
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 2d71b1115916..c132178fac07 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1140,6 +1140,39 @@ char *resource_string(char *buf, char *end, struct resource *res,
>  	return string_nocheck(buf, end, sym, spec);
>  }
>  
> +static noinline_for_stack
> +char *range_string(char *buf, char *end, const struct range *range,
> +		      struct printf_spec spec, const char *fmt)
> +{
> +#define RANGE_PRINTK_SIZE		16
> +#define RANGE_DECODED_BUF_SIZE		((2 * sizeof(struct range)) + 4)
> +#define RANGE_PRINT_BUF_SIZE		sizeof("[range - ]")

I think that it should be "[range -]"

> +	char sym[RANGE_DECODED_BUF_SIZE + RANGE_PRINT_BUF_SIZE];
> +	char *p = sym, *pend = sym + sizeof(sym);
> +
> +	static const struct printf_spec str_spec = {
> +		.field_width = -1,
> +		.precision = 10,
> +		.flags = LEFT,
> +	};

Is this really needed? What about using "default_str_spec" instead?

> +	static const struct printf_spec range_spec = {
> +		.base = 16,
> +		.field_width = RANGE_PRINTK_SIZE,
> +		.precision = -1,
> +		.flags = SPECIAL | SMALL | ZEROPAD,
> +	};
> +
> +	*p++ = '[';
> +	p = string_nocheck(p, pend, "range ", str_spec);
> +	p = number(p, pend, range->start, range_spec);
> +	*p++ = '-';
> +	p = number(p, pend, range->end, range_spec);
> +	*p++ = ']';
> +	*p = '\0';
> +
> +	return string_nocheck(buf, end, sym, spec);
> +}
> +
>  static noinline_for_stack
>  char *hex_string(char *buf, char *end, u8 *addr, struct printf_spec spec,
>  		 const char *fmt)

Also add a selftest into lib/test_printf.c, please.

Best Regards,
Petr

