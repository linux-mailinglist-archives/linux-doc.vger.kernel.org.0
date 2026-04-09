Return-Path: <linux-doc+bounces-82903-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIQCM6q512l0SAgAu9opvQ
	(envelope-from <linux-doc+bounces-82903-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:37:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DAA3CC189
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2E3A300E3D7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5002EC0A1;
	Thu,  9 Apr 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="G9kWLVmV"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F029B78D;
	Thu,  9 Apr 2026 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745444; cv=none; b=mSm2QXeZewLsjJ1Qhb+b/gIUZDldDQJtKuYdNFexutor4C7D4BjUJKKRZjv2PfKXJaomuyavBJVYFpWzGIeOooPYN3d4WTH0XwuS/kMWQD5bsOa5w3P8vBwRaKKCrndcHKKRiauOVteCeS+9GFgZOhjmzcqthRWnSrVOus5asTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745444; c=relaxed/simple;
	bh=B/Aw2bONDzZSH2ZxxHWPZyNKI51MHzK2qyXgpcg38CE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SkCgp/BnpzFve6JKSHpTPLAY1rhcBSyuVgZuGZ+1/nYr1np+ouKcYpaPVdNHTdo9uD8AsADpG6SJK9JorZwHu08DjnWnpF8X3GVzTbzNDBNMw7VjGREy+pm/L5/Iwlv2epGHb1JCUW6zZ9h+M2jKF5EyQLoq2z33FyxXPfhb598=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=G9kWLVmV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40C85410A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745442; bh=B/Aw2bONDzZSH2ZxxHWPZyNKI51MHzK2qyXgpcg38CE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G9kWLVmV7dMw+bykDkxWfPN9wcXmej7vadg6yhxEBrhnpd7t9fPCNOml9rKb0LwBX
	 sCWWF/lFpPMB8tdzWxf8BrytHLNP+rNIpJ+ldCVi0m0+j0eyh4AdoXNTMko6rYQBZu
	 /iC0TRB0XreJ+SUxkPTcnOSx2b3hPReaMHSG5fyHm3TccF6qT3uN8cnIiegzz3t6ON
	 oVEpdNfUMmfJtCnI06Fxn2/I5idXkhpHd9BewOzR29RVpj8QsJExz2W1+jUdvpjdzU
	 GSzRr4jRC4hFoJNzXVH483yQdFKMNu7ZUCG0uAYnZXtrKAVk50gl+MN/qQTboydPOY
	 PfU+aytyuubow==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40C85410A5;
	Thu,  9 Apr 2026 14:37:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: lirongqing <lirongqing@baidu.com>, Andrew Morton
 <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Li RongQing <lirongqing@baidu.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Feng
 Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Dapeng Mi
 <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver
 <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH v2] Documentation/kernel-parameters: fix architecture
 alignment for pt, nopt, and nobypass
In-Reply-To: <20260330105957.2271-1-lirongqing@baidu.com>
References: <20260330105957.2271-1-lirongqing@baidu.com>
Date: Thu, 09 Apr 2026 08:37:21 -0600
Message-ID: <87o6jsb3oe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baidu.com,linuxfoundation.org,infradead.org,linux.alibaba.com,linux.intel.com,kernel.org,google.com,gmail.com,intel.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82903-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 51DAA3CC189
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

lirongqing <lirongqing@baidu.com> writes:

> From: Li RongQing <lirongqing@baidu.com>
>
> Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
> into kernel-parameters.txt") introduced a formatting regression where
> architecture tags were placed on separate lines with broken indentation.
> This caused the 'nopt' [X86] parameter to appear as if it belonged to
> the [PPC/POWERNV] section.
>
> Furthermore, since the main 'iommu=' parameter heading already specifies
> it is for [X86, EARLY], the subsequent standalone [X86] tags for 'pt',
> 'nopt', and the AMD GART options are redundant and clutter the
> documentation.
>
> Clean up the formatting by removing these redundant tags and properly
> attributing the 'nobypass' option to [PPC/POWERNV].

Applied, thanks.

jon

