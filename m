Return-Path: <linux-doc+bounces-95268-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vwkgJP84TGqfhwEAu9opvQ
	(envelope-from <linux-doc+bounces-95268-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:23:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84147164B4
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:23:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ubuntu.com header.s=fe-953a8a3ca9 header.b=Jl+uKqXM;
	dmarc=pass (policy=none) header.from=ubuntu.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95268-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95268-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 616EF30356F5
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 23:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490983F660F;
	Mon,  6 Jul 2026 23:23:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBAE3E51E8
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 23:23:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380213; cv=none; b=VSbs1qagQ2Idzk1BleE3+Uw2tVaQ5kIjeuPKR2PLPtLLUdq3wDcTeG2XQpAM1kUPTNxPQEly81CrkpWeQV8Wi3CyejtrYC+Y46eZkGwwE70n5dPNB+Mk+Au/53wsbMjx9UNhS9UYB5R6LcwohDLQt/bQNcR+tcXzpwc9SKNG8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380213; c=relaxed/simple;
	bh=rWWebR3w8Mim8nqyrpPGlBB+sWkzlr8vPrDMP4Qn8+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hM5tdu+99y8XbV33xuDsIL25ls07Y3zMPuUKhPMEdAmCah33fHR6dhFd+ceuPqvl4ZxALlg44vVbgn15igjPOft7o0MGeUGNEHmU9V+5V4ZjmgW4eLahSIIgwZpqvEb8eCPJl2rd/1Lirqu8be/fUorIAwxfgD2COadigO4NzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=Jl+uKqXM; arc=none smtp.client-ip=149.28.215.223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1783380210;
 bh=OEZrGANo2cEZWsDxSQlyGeYA6D2OMj2sQBUWO+CdYtI=;
 b=Jl+uKqXMLyKo/uN3yCDo9ku4BLb55S0RLaEdNj20VOZaKs8GrWkMERcyQo/uoZg+NzvxxGyNy
 iQI+1uz27iUdSgCChGLgROWzu+jhG8Zu2R5DnWHO71KDIPNqWapMOWtm5LmQlPA93+m16HgNY+W
 6ebv5Low9D0jwsnJDp52XGeXV+lVfwUelKSC5/Vb5B4oi8fAcBmTg0aq+ng6ATWspfHDw1XyvMj
 /I0pvEH7wZJSVC3XUDIKtiCmmumomtdfXa52X8W+mlAdd0pgXSUP853mDuw8zq/Mj5NvFUxCSnw
 pEPUyJlSh2hFRStCJ9lSJ3j/+otoKmtOyHDq0Sy45HsA==
X-Forward-Email-ID: 6a4c3867ebac8711c86b79d5
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.9.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 06 Jul 2026 19:21:09 -0400
Message-Id: <DJRVH1JI4C7F.3HZUQJ5YXD7BO@ubuntu.com>
Subject: Re: [PATCH] arch: arm64: add early_param idle=<wfi|yield|nop>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Yureka Lilian" <yureka@cyberchaos.dev>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <asahi@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
In-Reply-To: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95268-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yureka@cyberchaos.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:asahi@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:from_mime,ubuntu.com:dkim,ubuntu.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D84147164B4

On Sun Jul 5, 2026 at 6:02 AM EDT, Yureka Lilian wrote:
> +
> +enum idle_mode idle =3D WFI;
> +
> +/* User can over-ride above with "idle=3D<wfi|yield|nop>" in cmdline */
> +static int __init setup_idle(char *s)
> +{
> +	if (!s)
> +		return -1;
> +	else if (!strcmp(s, "wfi"))
> +		idle =3D WFI;
> +	else if (!strcmp(s, "yield"))
> +		idle =3D YIELD;
> +	else if (!strcmp(s, "nop"))
> +		idle =3D NOP;
> +	else
> +		return -1;
> +
> +	return 0;
> +}
> +early_param("idle", setup_idle);
> +
>  /*
>   *	cpu_do_idle()
>   *
> @@ -26,8 +48,13 @@ void __cpuidle cpu_do_idle(void)
> =20
>  	arm_cpuidle_save_irq_context(&context);
> =20
> -	dsb(sy);
> -	wfi();
> +	if (likely(idle =3D=3D WFI)) {
> +		dsb(sy);
> +		wfi();
> +	} else if (idle =3D=3D YIELD) {
> +		dsb(sy);
> +		asm volatile("yield" ::: "memory");
> +	}
>

And otherwise...........?

I guess it would be NOP, so do nothing - is this expected behavior?

-Josh

