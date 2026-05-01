Return-Path: <linux-doc+bounces-85433-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPNEHV4O9WnIHwIAu9opvQ
	(envelope-from <linux-doc+bounces-85433-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 22:34:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A24AF811
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 22:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3EF43010BB4
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 20:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C533D16EC;
	Fri,  1 May 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZmJQASpk"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E5421895;
	Fri,  1 May 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667673; cv=none; b=e9Sceb4QwWaIzV+JPI7Q2quGbhvOXmOZLDc1CHpfux9eSbXdGaipqyPUGxd/+ibrzbNQwa9zmtIPsktUBMA7goN0M8f6JxHNKm6GeAP23mZkyq1EHQL18xftXLChzVpVTCEoVXpP7KRd5mA84YV8MLLRPNK/USFNjkcf2cUoXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667673; c=relaxed/simple;
	bh=bZN3/dDl/N/BW4VSa+lQKR6PsbyLxu2lnNq3BRBi1EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vdlw6p5qMY57UlCoORljL2RQQI/UWUiC/c3XMOiyLwIhq9nzfwI4eEnvaqc6HNhY/xfNyDiz6xUsnnA7+iX0PkB/WAlChqxSxJI2fNrxOwlrjXpydDDqM+ABmP2togVgk1aGQcrpsGXU277FjbYgfHSXz7fLSV43GiDIOnT0F2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZmJQASpk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=kwofkglT0UKAQyH4oQDWBijGICgphUhKZgKEs845LpM=; b=ZmJQASpkBKQPOG/lmASsWLbnJ/
	tJoCQrCe6NO5iEvJyMKZaX5VkYdvvfyGFfsnaYtPLLbbN5qF1lr6zo768lSPlgefgPeNzYUTwGojt
	hnGtxXCRgMtYaGSSAgASJVirZtxgc/Hf2RVc9Ab7cDXpW5pCLiCRh1prcev+P7ynZXF9kmJJLUGqa
	Su112XopFPUANVtxPFRhliMDIpLk11Bja844HP90XEwX/hde6htdWdTXzjbTCi0u2j+thzBXd3M6a
	/eS3HIaP5CdIE8yZRIX/KvPamwrb549FVo0iA6CvB0XEiubWoXqruj1pyF8SlaoX3FvLF9jpnoUHk
	auaO3VAA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuZ0-00000007f9e-30vZ;
	Fri, 01 May 2026 20:34:19 +0000
Message-ID: <d813fb5a-9256-4f0c-8663-c198cca9f80f@infradead.org>
Date: Fri, 1 May 2026 13:34:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: Remove icn= ISDN parameter
To: Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
 Marco Elver <elver@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Li RongQing <lirongqing@baidu.com>, Eric Biggers <ebiggers@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501182634.1110715-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260501182634.1110715-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 463A24AF811
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85433-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]



On 5/1/26 11:26 AM, Costa Shulyupin wrote:
> The ICN ISDN driver was removed in commit 02bbd9802da7
> ("staging: i4l: delete the whole thing"), but the icn= kernel
> parameter documentation was left behind.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 41c657cd362c..6e21d8638d77 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2245,9 +2245,6 @@ Kernel parameters
>  			syscalls, essentially overriding IA32_EMULATION_DEFAULT_DISABLED at
>  			boot time. When false, unconditionally disables IA32 emulation.
>  
> -	icn=		[HW,ISDN]
> -			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
> -
>  
>  	idle=		[X86,EARLY]
>  			Format: idle=poll, idle=halt, idle=nomwait

The pcbit (ISDN) driver has also been removed.
Would you also delete this line:

	pcbit=		[HW,ISDN]

-- 
~Randy


