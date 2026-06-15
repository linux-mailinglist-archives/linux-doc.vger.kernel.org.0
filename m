Return-Path: <linux-doc+bounces-92393-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NvDSH7ECMGr0LgUAu9opvQ
	(envelope-from <linux-doc+bounces-92393-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 15:48:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA0686DC4
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 15:48:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CLH5h3hn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92393-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92393-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9C8F3014503
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 13:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD9F3F5BCB;
	Mon, 15 Jun 2026 13:48:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3043F5BF9;
	Mon, 15 Jun 2026 13:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531310; cv=none; b=ZIPBR11V6h6TpYBN1m5t8F7Cp+v1qj+5dctzPjcOco7W/mAoKY6qTQ2TAa81m7BAkCWll2iOU8J7HYMRYA3zGxJtnPCkEWa7Rw/BcY0sfANgUQWNsAUMPThl1VxYCcV0t3gUrI7PRCez7oQoboKMK5Rxa5/b3ryvTzuViimK6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531310; c=relaxed/simple;
	bh=inx8KrsbS4vy/PkUHx9LLJha1RMq1uYeun2BM1UGKW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ohy1VxDXpSYnpNCg0L/d+RaXofgFMz+6L2lbdp53U/1WqN3WA/wZj5zPLhBEhjQe+dlCjXt1Nj+wsWtyCbXGTk+U0xcup4+AHNsTgn6+W8AtEtTUAmUX4EJYu3U0Sbrwy1fJrauEyWZiRfP797wS/z5TvpBmGTql13pcjkmv4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLH5h3hn; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781531308; x=1813067308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=inx8KrsbS4vy/PkUHx9LLJha1RMq1uYeun2BM1UGKW8=;
  b=CLH5h3hnwaLI6zgqcdTQ+V0fdfC9T6CQChkspXtOTU/bN9Mh5YHqcIHp
   Hd2wC5EsJdlF6lF2525ApNI01Dk3/u8JbdKtp4JmHd5zLB6+ClmMrXaJy
   EnJwZbtp7eGGu0xFEhWI0NhvDrRwshvoItW2nj68i9Ntry8XUDJmqkMPu
   5W98q/UlaEzJdLPBs7l1yMy2q1QxzyuKzIwfCKckhGAcBEuZ3fFFV9g1I
   Bh8047SNDty50Br9F4iqVwDO/T3tXjqian3JMqVCwzNlAgRB1WOHQsNS7
   0UWIxGGiKkEV6jr4EQbM7kfSNAp5H+1xIjL1bunsvbGAdwcPs7hTgBWAa
   w==;
X-CSE-ConnectionGUID: IuVy3KfqSlukzvNkeFP6YA==
X-CSE-MsgGUID: PGku37lNRTGt2/Z1El3DrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84835607"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="84835607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:48:27 -0700
X-CSE-ConnectionGUID: 2IMCQWYHQWOwZ3MoS8fvGg==
X-CSE-MsgGUID: 1xiKOP3KQWKcsralxbv5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="271176304"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2026 06:48:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CA93C95; Mon, 15 Jun 2026 15:48:22 +0200 (CEST)
Date: Mon, 15 Jun 2026 15:48:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefano Zacchiroli <zack@upsilon.cc>,
	Steven Rostedt <rostedt@goodmis.org>,
	Laura Abbott <labbott@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Wenwen Wang <wenwen@cs.uga.edu>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Subject: Re: [PATCH v3] Documentation/process: Add Researcher Guidelines
Message-ID: <ajACprp9UJp2JSJM@black.igk.intel.com>
References: <20220304181418.1692016-1-keescook@chromium.org>
 <ahgaOigklcDCYvRp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahgaOigklcDCYvRp@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92393-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:keescook@chromium.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:zack@upsilon.cc,m:rostedt@goodmis.org,m:labbott@kernel.org,m:julia.lawall@inria.fr,m:wenwen@cs.uga.edu,m:gustavoars@kernel.org,m:linux@leemhuis.info,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,black.igk.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCDA0686DC4

On Thu, May 28, 2026 at 01:34:34PM +0300, Dan Carpenter wrote:
> On Fri, Mar 04, 2022 at 10:14:18AM -0800, Kees Cook wrote:

...

> > +  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
> > +  11.2 show no new warnings, and LeakMagic no longer warns about this
> > +  code path. As we don't have a FooBar device to test with, no runtime
> > +  testing was able to be performed.
> 
> People have started sending commit messages in this exact template and
> normally I would ask them resend with the meta commentary from this
> paragraph below the --- cut off line.
> 
> Do we really want this "Compile tested only" stuff in the permanent git
> log?

+1 here, can we rather avoid flooding commit messages with the meta, that
anyways is available in lore.kernel.org archives?

-- 
With Best Regards,
Andy Shevchenko



