Return-Path: <linux-doc+bounces-92159-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id do52Ed5DLGpbOgQAu9opvQ
	(envelope-from <linux-doc+bounces-92159-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:37:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87A67B647
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=digikod.net header.s=20191114 header.b=ABr+07Nh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92159-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92159-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42F12316C40E
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CA138F25A;
	Fri, 12 Jun 2026 17:35:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAF3FF8AC
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 17:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285720; cv=none; b=AD6gD/JwydTA6P8XcO8V6TtmqNK/JkiCZt5Sc40/7B6VjbKrnYKMYkpfZCl1mhz1H6e9tjUw+Gw3SOGioT6gatkch9RZU2ZAmXAWD7geI/bYDcXKxTDr8yJUb2mO0njfZxjn4gyqo0Wc6+f5HxwOMVZysPyO+jdQWRSWsVhWzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285720; c=relaxed/simple;
	bh=WxmJ8dAhtUVAVstLFuyTgPV6qBGG7gU83EedcrcZ2KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdkwIQ9ysL/PqJkUER881XahDkZc4ZIl+XsUpA8y/AshJ/kHWveFb5ebuSLpIuZX+I7UVaIsx8u0XVLa/6lOMgDj4dWp6FOScl/ZneUjkg3QOj3vTwrLN3cJRyKJNFBiQrUkIDNamlp7mOdFFMjL6DTNFNQ+k8zH/QqbFpQbFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=ABr+07Nh; arc=none smtp.client-ip=45.157.188.9
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gcRVP1nYMzltt;
	Fri, 12 Jun 2026 19:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1781285709;
	bh=oWdBhnrdbwzVv6nbhKR3nuIWPHA1TJG+Tz0/+aT/flg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABr+07Nhi4wGjGSgLtjRLZ2iHdZMOxW2cZsIEYoCByym7TNpCVv044wCaz1W+1TYF
	 LN5jN6THT38YVcQtzPSPhkM6gAfRy5Er6NZr+1elZeOBptg4dTAN3+2psDOFOeVZfV
	 +MZ9K1ll1AhsUwu0STL+iwiXRWDz5i/2zo3T7Daw=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gcRVN00MvzQMK;
	Fri, 12 Jun 2026 19:35:07 +0200 (CEST)
Date: Fri, 12 Jun 2026 19:35:05 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, 
	Matthieu Buffet <matthieu@buffet.re>, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [mic:next 15/15] htmldocs:
 Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted
 text or phrase reference start-string without end-string. [docutils]
Message-ID: <20260612.waicoh3ohF5e@digikod.net>
References: <202606120923.1nYYlfdb-lkp@intel.com>
 <1cc99145-0316-44f5-b134-2b4f90b326c4@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cc99145-0316-44f5-b134-2b4f90b326c4@infradead.org>
X-Infomaniak-Routing: alpha
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[digikod.net:s=20191114];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92159-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:lkp@intel.com,m:matthieu@buffet.re,m:oe-kbuild-all@lists.linux.dev,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[digikod.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mic@digikod.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[digikod.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mic@digikod.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,digikod.net:dkim,digikod.net:mid,digikod.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB87A67B647

On Fri, Jun 12, 2026 at 08:35:57AM -0700, Randy Dunlap wrote:
> 
> 
> On 6/12/26 12:52 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
> > head:   a6f0a6f5377fae42a8028f63c89d544c68f24b60
> > commit: a6f0a6f5377fae42a8028f63c89d544c68f24b60 [15/15] landlock: Add documentation for UDP support
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> > docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> > reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120923.1nYYlfdb-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606120923.1nYYlfdb-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    Scope flags
> >    ~~~~~~~~~~~ [docutils]
> >>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
> >>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:40: ERROR: Unknown target name: "filesystem flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
> >    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
> >    Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
> > 
> > 
> 
> In case it's not obvious:
> 
> > vim +768 Documentation/userspace-api/landlock.rst
> > 
> >    767	
> >  > 768	Starting with the Landlock ABI version 10, it is possible to restrict
> >    769	setting the local port of UDP sockets with the
> >    770	``LANDLOCK_ACCESS_NET_BIND_UDP`` right. This includes restricting the
> >    771	ability to trigger autobind of an ephemeral port by the kernel by e.g.
> >    772	sending a first datagram or setting the remote peer of a socket.
> >    773	The ``LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP`` right controls setting the
> >    774	remote port of UDP sockets (via :manpage:`connect(2)), and sending
> 
>                                             missing ending           `

Thanks, fixed!

> 
> >    775	datagrams to an explicit remote port (ignoring any destination set on
> >    776	UDP sockets, via e.g. :manpage:`sendto(2)).
> 
>                                        same here
> 
> >    777	
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
> -- 
> ~Randy
> 

