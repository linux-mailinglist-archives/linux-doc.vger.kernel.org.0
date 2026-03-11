Return-Path: <linux-doc+bounces-78875-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB/NCheVsWnkDAAAu9opvQ
	(envelope-from <linux-doc+bounces-78875-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 17:15:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A869267285
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 17:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C94B300E489
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 16:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD00831E83B;
	Wed, 11 Mar 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pcwlseim"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9762571D7;
	Wed, 11 Mar 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245710; cv=none; b=UB2OgqB/JSsPSH2gJ+1PpDBHPTl4YmGiNCb7dNMJVrcC5mermOnNyby19n4dXEB2LBwaQp+5hMl3GWhvHGpfXrNQZ5L/j+20Yal87+gZZ9VD34DkQ/6eJ1OCiHy++ni2lOwa89Z/R5mZ1hjkn4awSJ6ZtFrtbR4xof6BMBdTqHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245710; c=relaxed/simple;
	bh=CbMK7lGLuBy/mVHODtrBYGEKASRn4zPT6fBp5qVbBEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbm5WgoaRyhmkpUSjnw9Xfd6lMPgbIa9lbrRhbg9uHuzIJTocBAIBIFDWfqO98c13j2SqxFWZJX6vQwsiGOUqfkuQA9kYQdng1MsnYAZ5Z6Eo/Ysr53pH258oTCihixIxxgh/MHwBjSKZm5DXwhpKRBoDtK00g1FFxdCl7xQMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pcwlseim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD13C4CEF7;
	Wed, 11 Mar 2026 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773245710;
	bh=CbMK7lGLuBy/mVHODtrBYGEKASRn4zPT6fBp5qVbBEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcwlseimBmtJ+R8ifM5OBtKMjXl93njoEtqe0FmwkecIZ5UD8WhNM8AvjG7dmcPo5
	 Hmrhh7y3Omrc1E2X0xbwBteVoxxSvY1MVcoIif1l9Nmr8wVbuc//Nx6WwJ+1/nhxoc
	 XCtCo8K2ZYMN/TL9i+AsD0wfQXDEZq6xA5BcJssHZISgyumrRJn705kWJ11sVwe4f2
	 NjnXY28UoeZwTBivr64+/iLmsRhdd/senL31cmLQ6ZQxrPzmP8Fh79xuysoRir9V7a
	 IU/3JGUjoD5WVlImhgNM8tbwh9GS4EUXBJn5dUPK3V/T/ljjHnG5EcZA4b4Pk/kIpb
	 0uUc1TYKMrwgA==
Date: Wed, 11 Mar 2026 12:15:08 -0400
From: Sasha Levin <sashal@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] checkpatch: add support for Assisted-by tag
Message-ID: <abGVDLhXxHju_Zwb@laps>
References: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
 <20260311152039.254244-1-sashal@kernel.org>
 <65ad15f96429d87225867e982cd1aab2@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <65ad15f96429d87225867e982cd1aab2@perches.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-78875-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,acm.org,lwn.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A869267285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 08:33:26AM -0700, Joe Perches wrote:
>On 2026-03-11 08:20, Sasha Levin wrote:
>>The Assisted-by tag was introduced in 
>>Documentation/process/coding-assistants.rst
>>for attributing AI tool contributions to kernel patches. However, 
>>checkpatch.pl
>>did not recognize this tag, causing two issues:
>[]
>>diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>[]
>>@@ -3105,6 +3106,13 @@ sub process {
>> 				}
>> 			}
>>
>>+			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
>>+			if ($sign_off =~ /^Assisted-by:/i) {
>>+				if ($email !~ /^\S+:\S+/) {
>>+					WARN("BAD_SIGN_OFF",
>>+					     "Assisted-by: expects 'AGENT_NAME:MODEL_VERSION [TOOL1] 
>>[TOOL2]' format\n" . $herecurr);
>>+				}
>
>I believe you could use next instead of this odd indentation avoidance.

Let me figure it out. My perl-fu is... questionable.

-- 
Thanks,
Sasha

