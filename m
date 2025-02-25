Return-Path: <linux-doc+bounces-39351-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5086A440F4
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 14:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E593A7C93
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 13:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE25269830;
	Tue, 25 Feb 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="zKBcbCuE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462310A1F
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490574; cv=none; b=EPoLMvhcqcwkoRWLVb2PqlAXvzGOBFhzj78Wrsl99MQKG11P/I6LxkBTcmZBl54JxmOVjv+aJzcNFJYF9pYDCrxrnMfve5bYBNYXoR+DB1hb9qwhKeyHZRTsVNOhpttg7yZ/0A2CpFHdmMitp6y5sfbTVJ7ZVjhq+FF6fxglbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490574; c=relaxed/simple;
	bh=6zIDGY7o8wonG5XSWfvfNzMNhLDCQ4e5sFlmf6YJhHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTL1T6VKnnvRVSitzriIURu7JnRwYGvWdEt3ETX3DqIyvWfVnsytLoHhr4/GSvSbUQ2WL7+endbLOimL+1Vsrkb3HftVhgH+S10nEWY9wEFKhaYgf3X/mYZKMz1CSs6JAimCB4VJIZ43OrVA3SQ6k/BIO3rTm2Oe1vrzUpq2+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=zKBcbCuE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso7667668a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1740490571; x=1741095371; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZPYRoqfrPagvwL/VaIj4ZSda7O5NYpHMyVSIETeVto=;
        b=zKBcbCuET1NBYuwsZqMtPPNWwln0LKbAGf9DiFhMvxHo3ePFgv2ZRwHQ1m+/X3IXF0
         /0SyQqa7PogVHz8goMiWLt/TcbuRvjr61hXI6Yae2IYtOQ8Qc2PTJ6GeOKMcJm07Lj1S
         7OKvrE31v1Jg1a7dgnH6XD2udWEbDnBhB3JWSufEr3izLLu6QVF4woo+GD4kOay2Dbxx
         6+6LshdWjmMXJiGBnp8jmvL4CP1ppPdxBwzFEiVr32IaTGIAk0VIHGawXnTF4Ng7F7Mp
         Nv8dajrEdryY97lRYRzVO5k7lLkXEGcYFFF+DloGD19YYuiCmIjxymramJBqepcGpBQY
         zHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490571; x=1741095371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZPYRoqfrPagvwL/VaIj4ZSda7O5NYpHMyVSIETeVto=;
        b=nd7qiWReu52ORZrn561XS67SKHWDVMc6pJuuDhR13lSq0c77hmzwccr8U7ofYAvj/C
         QZqFrEnYxOLvBArXk41bBovFoNpsTsyEnm3bTGBmuCadkRcgoVKtgTMeYddNHb7XDPRC
         uw22d06iTfWwC403VjIfK0of1L4JkYzd2dlsQp/wBCLRmVjRZBvdCaY3i3gUG4mJoo5r
         NIwy3nsmyOQYAheA5gkgxW1GIZbPbJcbcjoc9NthiXj6N5kp91LWymMAzHrXpVqsHdpQ
         6WBxzizbHPx6HfIPhZPd33YZO69RQkxPkD4McLPjLS4igvbH/iQer/GnnKyE+AEb6Gyb
         zONA==
X-Forwarded-Encrypted: i=1; AJvYcCUFHT8SvYNNzjGZkKMI/kJA+c30ofm3p07oLOh8dgMFYv/DyXgGKmY8SwRMZZpMi9W6H3PUJ/s8DIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH+XpqhJO6w2/oLi4DYr2kd5vOoWeJbr1hVm3BoSUr1ySrDoLT
	HdWEddOSrbj63c729T7ys+jC5zv6MBnNRUUtzQdgt7tN+P4yVNWyvwQGQvoXp07aUJr0xc9Iygn
	m
X-Gm-Gg: ASbGncux7c0595ln2rZ1WDv8uvoIBgPeVs/ULadO3BOdTzd5jwZsAjwxT4cz8pdSao4
	FcIVVg74AJOvUAl5MeVGteD89IRR4tKBowUi4kekPYvuW5qK2lpu4wf1KHidWNAj0zzyiPiZOCk
	fKIfj2oMijxfpthdoRphdGH3lhCkDO6ZiZ7NrkKqriXtpL8sDaIa+/s+E3LE/LeRQHdnHfPE2S2
	L60PFkrNZSNuK1MRwei4Y7Qg97REUJEQsdI4HSR9SAZOS+YwCJGkk9FMevdCurfWYscUBNmbvVf
	QsqgXyYTuZxysQ86KfTLEZ4XkqrqeNb4WJpqN9b2hje+KUJlhpmA6g==
X-Google-Smtp-Source: AGHT+IGwZxstsJgbZbrGjWctQYTkmnZEeqGMf6YIvXycHvPmwGPJt3l7AO/RiG5BKR9nAP88NqhdmQ==
X-Received: by 2002:a05:6402:4604:b0:5e0:7cc4:ec57 with SMTP id 4fb4d7f45d1cf-5e44bb37281mr6445272a12.31.1740490570625;
        Tue, 25 Feb 2025 05:36:10 -0800 (PST)
Received: from jiri-mlt.client.nvidia.com ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2057276sm143453466b.142.2025.02.25.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:36:10 -0800 (PST)
Date: Tue, 25 Feb 2025 14:36:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jiri Pirko <jiri@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 03/10] devlink: Serialize access to rate domains
Message-ID: <qaznnl77zg24zh72axtv7vhbfdbxnzmr73bqr7qir5wu2r6n52@ob25uqzyxytm>
References: <20250213180134.323929-1-tariqt@nvidia.com>
 <20250213180134.323929-4-tariqt@nvidia.com>
 <ieeem2dc5mifpj2t45wnruzxmo4cp35mbvrnsgkebsqpmxj5ib@hn7gphf6io7x>
 <20250218182130.757cc582@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218182130.757cc582@kernel.org>

Wed, Feb 19, 2025 at 03:21:30AM +0100, kuba@kernel.org wrote:
>On Fri, 14 Feb 2025 13:54:43 +0100 Jiri Pirko wrote:
>> For the record, I'm still not convinced that introducing this kind of
>> shared inter-devlink lock is good idea. We spent quite a bit of painful
>> times getting rid of global devlink_mutex and making devlink locking
>> scheme nice and simple as it currently is.
>> 
>> But at the same time I admit I can't think of any other nicer solution
>> to the problem this patchset is trying to solve.
>> 
>> Jakub, any thoughts?
>
>The problem comes from having a devlink instance per function /
>port rather than for the ASIC. Spawn a single instance and the
>problem will go away 🤷️

Yeah, we currently have VF devlink ports created under PF devlink instance.
That is aligned with PCI geometry. If we have a single per-ASIC parent
devlink, this does not change and we still need to configure cross
PF devlink instances.

The only benefit I see is that we don't need rate domain, but
we can use parent devlink instance lock instead. The locking ordering
might be a bit tricky to fix though.


>
>I think we talked about this multiple times, I think at least
>once with Jake, too. Not that I remember all the details now..
>-- 
>pw-bot: cr

