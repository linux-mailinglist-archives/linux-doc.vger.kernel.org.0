Return-Path: <linux-doc+bounces-92123-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lasMIH8nLGp2MQQAu9opvQ
	(envelope-from <linux-doc+bounces-92123-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:36:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA967A8CD
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:36:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=V1ya2k5I;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92123-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-92123-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75EAE3017AE4
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B0F395D9F;
	Fri, 12 Jun 2026 15:36:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E346394EB7;
	Fri, 12 Jun 2026 15:36:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278571; cv=none; b=AqGcBF6X+HKEa5k7cMHxDlvLj0oY6w0i2FKpxxDRuQlVxhm0wC8KYKleaHQEJeMPERXn974ggo4WE71o/z/XpPvaUyy3wiff/OXbQ+r9fDeTFfq9UK3/RDvw+dYLrjrWFM9ZC0fK01EHpqIqX0iEPpXPXBepEstafb5WmAhq/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278571; c=relaxed/simple;
	bh=IOg3E+hyKIUM+CoxiRenGgZ1IDKdduqBVHjLUGSUi/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T36G1G+ixxbzR+indc9+U2rMfOens4gp9PqSwjsYEpZBEv5S9KuNKLfTf4dldGCAJx9HEqyVI6gvPKGWOk6X8+uDz6+H+KHqOzxXLXPTocNdLUneKyzRouPbeGP04c2ItvoNkSG9q7U9XTOWE14ykFYKoUSFhlFJhe8FOw+G8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V1ya2k5I; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JeM9QXcvea1gcZCvDd51X5bSRLrcGHqydUaRYAFryGs=; b=V1ya2k5IUz5mf2ulYb4tGg4PrG
	p0TcUgNb0AcIZYXGi7AtZjiy8ZbuWIFW/kNrdkdwZMY6OzO484sZc0YqlnRknf1rpPfpzWl33Tn5p
	MSryqqEZp3LEKk1nFCGRvWx5hYsLeJRCi/RsOJIZ87ZtOAdx2npvI46L6a9MiqWS7jrNQtTaf2kmE
	FhdnDUqiiBBbFazsrD6p8kmm1V7ay35dFRiy2L8o++HwkZ+hydDB7zdNdkTPoQ8uvlqa/KE+MVt8T
	Ratt5pS7ZBy0GTfUVpx+iJyBlJrCg/fVpbtmlv+TvcCNIzwW1riUflujVrhWS1MYEbxoMJqf8Ocxm
	iuuqHIrQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3vL-0000000BAQm-0FaC;
	Fri, 12 Jun 2026 15:35:59 +0000
Message-ID: <1cc99145-0316-44f5-b134-2b4f90b326c4@infradead.org>
Date: Fri, 12 Jun 2026 08:35:57 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mic:next 15/15] htmldocs:
 Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted
 text or phrase reference start-string without end-string. [docutils]
To: kernel test robot <lkp@intel.com>, Matthieu Buffet <matthieu@buffet.re>
Cc: oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, linux-doc@vger.kernel.org
References: <202606120923.1nYYlfdb-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202606120923.1nYYlfdb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:matthieu@buffet.re,m:oe-kbuild-all@lists.linux.dev,m:mic@digikod.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92123-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1AA967A8CD



On 6/12/26 12:52 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
> head:   a6f0a6f5377fae42a8028f63c89d544c68f24b60
> commit: a6f0a6f5377fae42a8028f63c89d544c68f24b60 [15/15] landlock: Add documentation for UDP support
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120923.1nYYlfdb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606120923.1nYYlfdb-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Scope flags
>    ~~~~~~~~~~~ [docutils]
>>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
>>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
>    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:40: ERROR: Unknown target name: "filesystem flags". [docutils]
>    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
>    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
>    Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
>    Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
> 
> 

In case it's not obvious:

> vim +768 Documentation/userspace-api/landlock.rst
> 
>    767	
>  > 768	Starting with the Landlock ABI version 10, it is possible to restrict
>    769	setting the local port of UDP sockets with the
>    770	``LANDLOCK_ACCESS_NET_BIND_UDP`` right. This includes restricting the
>    771	ability to trigger autobind of an ephemeral port by the kernel by e.g.
>    772	sending a first datagram or setting the remote peer of a socket.
>    773	The ``LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP`` right controls setting the
>    774	remote port of UDP sockets (via :manpage:`connect(2)), and sending

                                            missing ending           `

>    775	datagrams to an explicit remote port (ignoring any destination set on
>    776	UDP sockets, via e.g. :manpage:`sendto(2)).

                                       same here

>    777	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
~Randy


