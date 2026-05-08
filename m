Return-Path: <linux-doc+bounces-86465-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ/HGhoE/mlYmAAAu9opvQ
	(envelope-from <linux-doc+bounces-86465-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:41:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1C4F8E2F
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C76B30151D3
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 15:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6896B3FD135;
	Fri,  8 May 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="Qxk6pED8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281C3F787F
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254870; cv=none; b=KXovWur+PhN87ZWo6tnhIvwFhYXRvSL52qI9AkiCBs4VOUJz32jftI1CoU0l0e+QW1AczLqbt3FanGHrp2QswuXDgGYqogkc7svIWBxWTim5tS/YqbcVXZ//trU1L5HlV2LoYgGoyfAqUEG5SqgaFs6jHcxGQFyAKxbpO7tF9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254870; c=relaxed/simple;
	bh=cyGBiEtH7owjZ+3wjPCfXIGSFw9H1yMxnlcfEZMSYJI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=A66+jjIUqTgmEzbQ2Sdk/nfRxMnUiUMCpKHYYJKk2BPi20Ji+lnA18k5D4svE+hiNPzSMLdEflSenrFClKTKKELuFM8NRZyxoWsjeGDFyj0zvYGhOIo4UkNU/J8o2BUz/3Meg1lT/zPWAF8S+rRFhcNystsYtaRH69oaGEdC/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=Qxk6pED8; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1778254859;
 bh=dfYhS1DkNAeSK5tg73GFpmu4b1Dzj3tC81cPx/pc8A4=;
 b=Qxk6pED80OlhTQ1SW3WoHb9Mu0RFmSlMjld2y3Tqac4MgY0Q83nVi55zKLd4SBRi5azs6l5zE
 VE5JSlM0M2Kx6okFXE9jRisHYkIBgyYlHPDciT5Y/UJsPFMJMGG+buvouSCiCv50Pcwx2ehPfpa
 LEgumTytooD08172LCwIHSguHXbZ2SkOn9xzjeCYXxDkrHHeWsyU3neI1QWTWrtKfjS9v62ZpPn
 nphJor3QJA7/uRbAxhHd77QU+C+R9ufUTpQwmti7nfZn+uOYL8n05Y8IH0F8XiT8zY+nmn/XYXd
 L6NPXMvklvZL2zt4WSxIcBJ/lhse6EjqJTHPeaMEqPpA==
X-Forward-Email-ID: 69fe04098d5081d1392a8776
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
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
Date: Fri, 08 May 2026 11:40:54 -0400
Message-Id: <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>,
 <akpm@linux-foundation.org>
Cc: <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
X-Mailer: aerc 0.21.0
References: <20260507070547.2268452-1-sashal@kernel.org>
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
X-Rspamd-Queue-Id: C3C1C4F8E2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86465-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ubuntu.com:mid,ubuntu.com:dkim]
X-Rspamd-Action: no action

On Thu May 7, 2026 at 3:05 AM EDT, Sasha Levin wrote:
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped=
 on
> the next reboot.
>
> A lot of recent kernel issues sit in code paths most installs only have e=
nabled
> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock,=
 ax25,
> and friends.
>
> For most users, the cost of "this socket family stops working for the day=
" is
> much smaller than the cost of running a known vulnerable kernel until the=
 fix
> land.

I like the concept - but is there any way to ensure that important function=
s
like malloc aren't being patched? Or some way to make sure that what is bei=
ng
patched will not kill the entire kernel?

I know this probably boils down to "operator has to use it correctly", but =
just
wondering if this was considered.

-Josh

