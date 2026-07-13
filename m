Return-Path: <linux-doc+bounces-96509-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YTnFEa+XVGoAoAMAu9opvQ
	(envelope-from <linux-doc+bounces-96509-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 09:45:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3958748521
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 09:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ezciMQaU;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96509-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96509-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2AF43033AB4
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 07:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F9D3914E2;
	Mon, 13 Jul 2026 07:41:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845D390217;
	Mon, 13 Jul 2026 07:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928502; cv=none; b=ogUxu/a4lr2WSLrL7DbB+JCrZXJTBAlF7jBFDxb+BCRewdaVmCXk4c9mnUzVQCLfuWoK8yMcEiY3lZRpDw/+VozCnF32cy8pn0mhhEi9ABNOrbtJNtjCPD2/rqmS0OawT1yXAJLZdYQ3oZDQs2QRiFAwCgbaMmE2xCO6wPClfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928502; c=relaxed/simple;
	bh=bAXVi8oYiUqAEBLabA5/ZzO9kOe53frHGuluLex3qGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knCH0uiWnUmUUUyuG7tFxU4I0SF7mUuEa0v4RzjgRzQQ8kf3K8p8IUUgW6wqEZQJAIPpOk67Wf0kzpFCOhXfYoie4N+P7V2XF+CW3BMW14pQwqCgbl4GwDrG7zGwPQn1yi5s+uslCLQ3ivn00E7ziyriqibFYO+Gb4idL716Mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezciMQaU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD321F000E9;
	Mon, 13 Jul 2026 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928498;
	bh=A3ntnML7IBlzf0c0DB9qQw01XNoLMs7pMdvAj3IbSe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ezciMQaUImIs/DLBfNxGTmxmj9i8LQ9uBXU2eYBkFBzlgmAuuvKQ6jyqh3+0H5DI3
	 5tns3TmMVQ/5rUFpRNaq/upl36U+2L+T0T6iIOQSPhDHLLriFkGX2l0OgZO6IrGkm7
	 79tnqfQPA+Ftiox2MfUsFEjI7cJBiw9ziElXHGFP9dTWUfaAwWdWdbOXL5D+1lyqJK
	 6LsK3QgiJVnqhswA4yDIkvnioQyE1DiKdBWqE+zKbMK4V46WlX1iw4dWdlkDpQdN/e
	 bU0rl3TyHAzOkI/As9FCQkeNaId0h3KfTRyP0KZWg9VZZVcvQ3/ly+uI5XH/AxvsGu
	 NlKSpJmsQZtHw==
Date: Mon, 13 Jul 2026 09:41:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Resend PATCH] dt-bindings: fix typos and brackets
Message-ID: <20260713-industrious-thick-hyena-13ac0d@quoll>
References: <802ebebbf204cbcec5cd73b6b0f19fc8ed10e86e.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <802ebebbf204cbcec5cd73b6b0f19fc8ed10e86e.camel@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96509-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:rdunlap@infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,gmail.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3958748521

On Sat, Jul 11, 2026 at 03:38:43PM +0200, Manuel Ebner wrote:
> Add missing '(', ')', '}'
> Remove needless '(', ')', '{', '}'
> 'lover voltage' -> 'lower voltage'
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> Sorry for the resend - e-mail clients ...
> Sorry for the noise the last days. When sending Documentation/ABI/ patches I got
> the advice to send each change in a seperate patch. For ABI it worked very
> well. That's why I did it.

Checkpatch points to errors. As expected, patch does not apply, because
it is corrupted.

Please carefully follow beginners guide for sending a patch:
https://www.linaro.org/blog/becoming-a-kernel-developer-part1-posting-your-first-patch/
(all series of above blog)

Best regards,
Krzysztof


