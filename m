Return-Path: <linux-doc+bounces-76118-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM4sFelHk2mi3AEAu9opvQ
	(envelope-from <linux-doc+bounces-76118-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 17:38:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDBF146425
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 17:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE0ED3003830
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 16:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCF6318EFC;
	Mon, 16 Feb 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8uNSReO"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF526158C
	for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259873; cv=none; b=P55j1gr8M2EqxFqF1OIL+LNwolzm0CzvCc0E84b6GtUOHiecYz8+I2Qvn2FIPec7x7qdWd03kMzlFPc6jfwgpjH6x0nf2yYMafMBQMOQKVJfLfgK3TbJ9Ev+14Rcgdqydq8NQuzcoShqfC2aFykvK1+zXBSLulsF98sJMAImls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259873; c=relaxed/simple;
	bh=0YFt5L3EQYeiE8fs3QZfHq0TJ01fe9XjKhIj4SeKC94=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI7f0mImrmSE5NlcZdtziikjENZEqaDk0aUC9P+wEOix/sk1BV1KMB8mDbDPA41sp5t5UysUlxYA2cguAoiBE/oxQvToDXozwU6YB7hUcmQOsIiD8lo+PI5uE4HtXtjxGPWI+lMcUQ+RlJGspvtFX2sewxgYxqY3kQ4NRRkTt8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8uNSReO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F629C19424
	for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259873;
	bh=0YFt5L3EQYeiE8fs3QZfHq0TJ01fe9XjKhIj4SeKC94=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=T8uNSReO4+XWronF/gXm9bxFNLiY2ZIeC2fPAkyd+pZGKDZaVWj8ThDqlLQ90sCsM
	 vmh/2NDzuAFBhCWGhneNPjbGF1r3pf3xtrXpXQKofb6ooJ0palLwTbiAJjY3xb08Zs
	 zzp1Ujn5WNs8LK3s9e9zOmgx7FES+p3xsInJHnl2CmlaiSvs5yvlg0Qf2hA8qQCYAj
	 bHmg07lcCCIn9fd8puPLLHcJ9GUMX0uTki0os4Yd8rNpvfL7kfufLkYPuz0IPTm0Nj
	 4FAUStwRZNW33BG9nDBbAyPuuP7w434YH9hF2Q7x8PPJj6KvqsOHCGfjZtPcb9HMOO
	 7BPGrZYyhli3A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso3575982e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 08:37:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJt/XlFwuXMhomYrtwdabFe/e6Qh5ep9/r70nS/p99YLrB2c5A1GlYlr54Daeyx+BAZfkvD6KZhNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpVobIIX6a4I3QAEtgpxkwRkmbxw9vNf/+TiIO4ZAF9+R22w8
	uak3GqlnhgxqRbjAW9GVxM7aMZ8Mf0hcTgqaaksb6x74a39IKgtd6rlPnd5XYsNv1vec5rnet0a
	FIliNn1YXkjU75IyNXJ4sBlEIZh0ZA8LfFcdrmtxFOA==
X-Received: by 2002:a05:6512:b02:b0:59e:4ce1:fe10 with SMTP id
 2adb3069b0e04-59f69c4e93dmr3612497e87.14.1771259871880; Mon, 16 Feb 2026
 08:37:51 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:37:50 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:37:50 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260213092307.858908-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092307.858908-1-tzungbi@kernel.org> <20260213092307.858908-2-tzungbi@kernel.org>
Date: Mon, 16 Feb 2026 08:37:50 -0800
X-Gmail-Original-Message-ID: <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
X-Gm-Features: AaiRm50BJf12deibLZSaH_InveKQYoLD86Ydy4bIVqFsywRt6lKDcedjAv_Vvxc
Message-ID: <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] revocable: Revocable resource management
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Linus Walleij <linusw@kernel.org>, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76118-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CDBF146425
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 10:23:05 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The "revocable" mechanism is a synchronization primitive designed to
> manage safe access to resources that can be asynchronously removed or
> invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
> errors when interacting with resources whose lifetimes are not
> guaranteed to outlast their consumers.
>

[snip]

> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> +

[snip]

> +/**
> + * struct revocable_consumer - A handle for resource consumer.
> + * @rp: The pointer of resource provider.
> + * @idx: The index for the SRCU critical section.
> + */
> +struct revocable_consumer {
> +	struct revocable *rp;
> +	int idx;
> +};
> +
> +void revocable_get(struct revocable *rp);
> +void revocable_put(struct revocable *rp);
> +struct revocable *revocable_alloc(void *res);

Is there any reason why we couldn't do:

int revocable_init(struct revocable *rp, void *res);

and then:

struct gpio_device {
	struct revocable rp;
	...
};

revocable_init(&gdev->rp, gc);

? It would be functionally equivalent to what we're doing now in GPIO.

Bartosz

