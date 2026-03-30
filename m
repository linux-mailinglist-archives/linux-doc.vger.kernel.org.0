Return-Path: <linux-doc+bounces-81786-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D5zHRWsymkx/AUAu9opvQ
	(envelope-from <linux-doc+bounces-81786-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 19:00:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9035F241
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 19:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40F253014932
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2759B38B7D4;
	Mon, 30 Mar 2026 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q50Yayq1"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09830382381;
	Mon, 30 Mar 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890003; cv=none; b=YllwSCuXBthu9Yt5kG2WPr/OL8Od4eU/jirB9tvHb1z1yV0djTBMu97fsX8Qg6cd4EYN2uVdy88WBGSqVdOPu5oZ1p8EtWsP573C9W1WpMtx0yQrlevpRB1layXl+1r2bJBsXWKPwEjvuQ8pzgYffa5E02zWk8lYFBPs9pMfdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890003; c=relaxed/simple;
	bh=2E4z28nhT7FyhJMGu2QGUXqZPc7uR54gBAMKcuXcsnY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T5aH4NQTbIoqeeB9MVOqMEsa23Xjq+nv+ixLc6aGdO7kXeN+FCAkfGTSnOFFgV54o0qUjRSCPQYsR2QkVy8ZD+eB0lGsZvk1JSvMpeTQy9UZO/yKQM5kLxhgXM7v/U2aDmLfbNJf0Ryyb6nn8yuQTonZvLr6PTg4CX6zhL0gVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q50Yayq1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CD6B41222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774890000; bh=drDK5feenNonmJTZCQaLxqlxBj2wLDZDbI19NKYvAuE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Q50Yayq1y625ELVT6WsktLB/Vi/ZIxp9p/TYWe12Yj7IcSeEkp92/sQ5uE+i6+cHB
	 RR7HU2PA7UOefLFCOoYa/HP3aE7o+YOGpyMxfRfC+dXxff2+EOq5WfBF9UK0pkzr0J
	 I8uZ7u6GrRXJCUKMm9l43EYMHKvddom3DJOXGg+Jem8BgFol3XUNpuFQljlGlXjXY1
	 5mnEnTUbmW9lBEnvQhuNke/+9OPtnIdgTK+uGTcS6oBgtlttYp4zewOFu2l+2uKoKK
	 4mNzVSKhurhHMRzvczDPu7z+aezAQWKiweZLkRsn4FB2hUgpJDAktf9jPq3xfeFTOA
	 xXkoE28CZHs0Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8CD6B41222;
	Mon, 30 Mar 2026 17:00:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Andrew
 Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Peter
 Zijlstra <peterz@infradead.org>, Feng Tang <feng.tang@linux.alibaba.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Dapeng Mi
 <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver
 <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XQ==?= Re: [PATCH] docs:
 kernel-parameters: fix
 architecture alignment for pt, nopt, and nobypass
In-Reply-To: <16386e7715284b22b5f72e7106ed5619@baidu.com>
References: <20260326074658.1899-1-lirongqing@baidu.com>
 <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
 <16386e7715284b22b5f72e7106ed5619@baidu.com>
Date: Mon, 30 Mar 2026 10:59:59 -0600
Message-ID: <87pl4lmewg.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81786-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[baidu.com,infradead.org,linuxfoundation.org,linux-foundation.org,alien8.de,linux.alibaba.com,linux.intel.com,kernel.org,google.com,gmail.com,intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 12A9035F241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com> writes:

> You are right , [X86] isn't needed , How about to remove the [X86], like below 
>
>     Documentation/kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
>
>     Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
>     into kernel-parameters.txt") introduced a formatting regression where
>     architecture tags were placed on separate lines with broken indentation.
>     This caused the 'nopt' [X86] parameter to appear as if it belonged to
>     the [PPC/POWERNV] section.

Please submit this as properly formatted standalone patch, so it can be
applied.

Thanks,

jon

