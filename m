Return-Path: <linux-doc+bounces-80586-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLyWFEyPwGkFIwQAu9opvQ
	(envelope-from <linux-doc+bounces-80586-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 01:54:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA12EB4F8
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 01:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D451D3007648
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 00:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22BF1A01BE;
	Mon, 23 Mar 2026 00:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="z39ouZfK"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A43F79DA;
	Mon, 23 Mar 2026 00:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774227268; cv=none; b=Ep2I/vuLCyK2U8iBmnjnyHMGexXVGs25tWV4U+QkerHfEL/xJ4QH6H5vDqjl82MB4mysDKARxLHa64GOOmcTwm3HVLE+WvdWhJhpU8+2ZHQJ5bw5ucarPSYog9p5RBvgoxE6NEb4Z+AjaTCoiN4knhRoWyuBRiIDzC9jQBfQ7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774227268; c=relaxed/simple;
	bh=xPO/6bhmiA7gIWQYx6HkqJrKJGQ9iHDbpkPgyQJOz5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTPkPmaA6pOcKJg5OELXpU+FF8ov4GhhQgOQisVaPs8eFVh9Ij8XkX62hM+Yceaqi/uG+boG0vmhG+n0T1wjUEFUSnQuTb21qVk6j5A+yZc/2A7kgqqXhmPIXpn9FPqQKur4ocvx+X5Bf6wBCNU+04GRjEydu+8lpdFwCZwFYS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=z39ouZfK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KbF/EUcuG7n05dH08Ijk3cZz7X2uy0K29wMkIptsrKw=; b=z39ouZfKT2QkzPI0uyEbwmv9xf
	G9sTOvXU4JVSgCNahIHj/hnzCp2s9RYUhfwzrUbr1G1BoZmDI+qMwxmGo8vNaD5S/Y921hqZtpIlT
	2A03+YBYF8SaWxEFixZw3ZTMBui39nvOERCn4Gu9NqHVFCI+ylXjqBNI76mxC4Q/CQZiqG0jkE9U2
	F/wzCNTraoBGqHL7SW2bx8uFlpeFPgcKbeg5ga1/5sEilByU85XXAn5G9jPDUgHAq9sH2gnRzMyMX
	B3t1LB1FMVnYG7b21rdAWfk/B+Mea/Ghrdf/j7S1K3yzsEQGSKkgNQTatS/NIJrAHbWUr824VfR9B
	vasYfNEA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4TYj-0000000FnjE-3vPB;
	Mon, 23 Mar 2026 00:54:21 +0000
Message-ID: <3de4c724-39bf-47f9-bf43-49552bc60a3a@infradead.org>
Date: Sun, 22 Mar 2026 17:54:20 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] docs: watchdog: general cleaning and corrections
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <875x7cddye.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <875x7cddye.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.673];
	DKIM_TRACE(0.00)[infradead.org:?];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-80586-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[infradead.org:s=bombadil.20210309];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_DNSFAIL(0.00)[infradead.org : SPF/DKIM temp error,none];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,infradead.org:mid]
X-Rspamd-Queue-Id: E7DA12EB4F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/3/26 9:23 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Fix some obvious issues in the watchdog documentation files.
>> I didn't try to fix every little niggling mistake.
>>
>>  [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
>>  [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
>>  [PATCH 3/5] docs: watchdog-api: general cleaning
>>  [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
>>  [PATCH 5/5] docs: watchdog-parameters: add missing watchdog_core parameters
>>
>>  Documentation/watchdog/mlx-wdt.rst             |    4 -
>>  Documentation/watchdog/pcwd-watchdog.rst       |   19 +++++--
>>  Documentation/watchdog/watchdog-api.rst        |   38 +++++++--------
>>  Documentation/watchdog/watchdog-kernel-api.rst |   20 +++++--
>>  Documentation/watchdog/watchdog-parameters.rst |   11 +++-
>>  5 files changed, 58 insertions(+), 34 deletions(-)
> 
> Wim, do you want to pick these up, or should I take them through the
> docs tree?

Wim, are you active?  Can you reply and/or merge these?

thanks.
-- 
~Randy


