Return-Path: <linux-doc+bounces-96315-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GuOJIIpFUWqYBgMAu9opvQ
	(envelope-from <linux-doc+bounces-96315-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:18:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363073DA7B
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:18:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=rQcp2iyh;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96315-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96315-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7678B300F793
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58143806D7;
	Fri, 10 Jul 2026 19:17:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9D37FF47;
	Fri, 10 Jul 2026 19:17:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711040; cv=none; b=OxJnwkR0bQP2pkbjrkVeoKfruDP+2+dIxd/tJKdZbuuSUbwuQs/6mSMjd2GvPzxVRRnfU9y9pa9Kg3zfZOxbynOYCQOGZyeWoP+D1agy/Xe2jbJGaHNG7u30is6vPQOrvUfxy9/ytFNsG/5v692qq2+gJLHMUtwkrSQU2BhyPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711040; c=relaxed/simple;
	bh=Tbjt4L3HLKnvppMXnKxzu7vV+YLNZYIAaX9s7DFrWns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q1d6XgED/BcKGQHu9oekTVKmfqrNoGfT1qtnvl0O0js4qoy4rsH5ce06+JmYzqd0pChrdTBc2YJE1dkyC5azAF6B1T5cn6L+EflKiqy1veZe0/zyeIs+Qy483IxOu1f+la+CwchT2E8C/1fkNuxbfLtWidwfiNwzu/NVuyi1et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rQcp2iyh; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6A954108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711039; bh=hieFuS276gQonHDGqyzywvVnwpgExFJfLyVk1oTADdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rQcp2iyhaZ5nynNTIvgjHVJWTfmMwuPvbTPZZ6dNxPW+V9Cpmh0eb6MQ5AL9l98sB
	 6Jby7hfE2xd/GRGodavs4CuxJupV+jhJobqmMkYT03OUtXqvEuLwkadKgeNR519Q0M
	 RPa+QaZQujAAZ7xIz1QgNhR3W7V/wW296bwf93b7fiiFY9qyN3L6razj1zi4uY908x
	 cRTx2RqXiSOjKE3wIhhClaSRQNzLakd1lILMIf5uNqZ1iIemDBms4NpPTvNvRpegtr
	 blrYJugB5M3I7zJZ8eoqAxPcezWjG3Fo0IN2c/JOpiHpctdJwmA3y5W6zzrUo8CdiW
	 bgTB5/wai2WpQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6A954108A;
	Fri, 10 Jul 2026 19:17:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Iwata Koki <iwata.koki@fujitsu.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Matthew Garrett
 <matthew.garrett@nebula.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iwata.koki@fujitsu.com
Subject: Re: [PATCH] Documentation: admin-guide: fix a doc for
 efi_no_storage_paranoia the "5KB" instead of the "50%"
In-Reply-To: <20260706050534.1653916-1-iwata.koki@fujitsu.com>
References: <20260706050534.1653916-1-iwata.koki@fujitsu.com>
Date: Fri, 10 Jul 2026 13:17:18 -0600
Message-ID: <87h5m6lkn5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iwata.koki@fujitsu.com,m:skhan@linuxfoundation.org,m:matthew.garrett@nebula.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96315-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7363073DA7B

Iwata Koki <iwata.koki@fujitsu.com> writes:

> The documentation for 'efi_no_storage_paranoia' incorrectly states
> the kernel cannot use "more than 50%" of the EFI variable storage.
>
> This percentage-based explanation has been outdated since commit
> f8b8404337de ("Modify UEFI anti-bricking code") introduced a fixed 5KB
> minimum reserve threshold (EFI_MIN_RESERVE) in
> arch/x86/platform/efi/quirks.c. At that time, the documentation was not
> updated to reflect this change.
>
> Update the documentation to reflect the "5KB" instead of the "50%".
>
> Fixes: f8b8404337de ("Modify UEFI anti-bricking code")
> Signed-off-by: Koki Iwata <iwata.koki@fujitsu.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied, thanks.

jon

