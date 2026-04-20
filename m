Return-Path: <linux-doc+bounces-83884-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KYlJ59J5mnSuAEAu9opvQ
	(envelope-from <linux-doc+bounces-83884-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 17:43:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A497542E7F9
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 17:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B54134935AD
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 15:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E064426A1AC;
	Mon, 20 Apr 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qUklP1/p"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E61A6826;
	Mon, 20 Apr 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776696333; cv=none; b=uRpJQAV0kcP23HjjoWMFpgZantkm+0cj1kUbxPPOx7q4IGKUhk/XjIyNUwz7Gnuz7u2C1gq5qzg7DKx89NkpARmaD3hJluEFPI3vpIRNpdwnAZKnSdt0TVRfZ7qZrp7ZTsl2nmi58RrqhoTOamX0eWoxMYYinKh/JXphauUjKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776696333; c=relaxed/simple;
	bh=SvaQ27ZLntPCN8k0ynbNBRKhvpHC3NyS9gEV8goeJ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDgV94PWTgxykGzBwfRFyxlKsxscX8gaFavVzdlWuQno80D//odIQCS4Q5B1GFsJk3VOZy3qWI9rPDmuOqGPFez3g+TfEPxG8Jw2fCJiD5qqBHgu+zL0BubeBA1qZLkr5xCirmjrwe6Dsx6Wr/o4uLkyWMMC1uXGHUWm6b85C2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qUklP1/p; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=upUX13WxUfVDv2KYdk6gfXaZWpjy4KqeBzOXlAvSvUs=; b=qUklP1/pNbHZeVb6KXus12lq+3
	0GJmppXom6kMnXxPxwAwH9Uxv278LswdAJdgUZjVJjlljIRg0NU4CbTxVMm6smuuBSfHNbLnfWEsL
	VdyLsQgfgBQSLHe7sT+kWB29u2x/f2BnOHRv2+hfMf3+EvEk/64ifrGA6lNldakK/GM6n+OFmNYMb
	xfcvsz3Im5Nb0iTs0KrbSEXFTpQkXzX2/a/JMWryQCHH9VKqNaZCgK61TnOCwXgnfcHkaLaOsTYmy
	/zM4/ARqpEtuOka6EFu9LlocNWuAMX8A/WNnMgrC/XNUB5NeWARuBuQK92HUMeFb2MbAmtkt/sASC
	S6XLx9Mw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpsA-00000008Zw5-1scd;
	Mon, 20 Apr 2026 14:45:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C58B0301BDE; Mon, 20 Apr 2026 16:45:12 +0200 (CEST)
Date: Mon, 20 Apr 2026 16:45:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83884-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,linux-foundation.org,vger.kernel.org,googlegroups.com,lists.freedesktop.org,redhat.com,roeck-us.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Queue-Id: A497542E7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:28:03PM +0200, Albert Esteve wrote:
> +bool __kunit_is_suppressed_warning(void)
> +{
> +	struct __suppressed_warning *warning;
> +
> +	rcu_read_lock();

	guard(rcu)();

> +	list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> +		if (warning->task == current) {
> +			warning->counter++;
> +			rcu_read_unlock();
> +			return true;
> +		}
> +	}
> +	rcu_read_unlock();
> +
> +	return false;
> +}
> +
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> 
> -- 
> 2.52.0
> 

