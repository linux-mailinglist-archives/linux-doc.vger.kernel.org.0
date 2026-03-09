Return-Path: <linux-doc+bounces-78480-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKSLEM3xrmnZKgIAu9opvQ
	(envelope-from <linux-doc+bounces-78480-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:14:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8723C8A5
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 863E0303A5C0
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 16:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38373A4F2C;
	Mon,  9 Mar 2026 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jmioQdSO"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16BC3B8BDC;
	Mon,  9 Mar 2026 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072448; cv=none; b=dSN2T1fo6CBuyZ/J9BW+cVB4x7uQdVhHZu7XyY4CSvmhOKd+ygEJ3z5Tf4TM2jJc/weBcKMQT/QKOGLc9TBwt0Oaxd8XhAZp+SlSUzWgux+mw9IVVDJi16qk6QbCUoeFhvtnPyQ3sAqQwAE2ULrvbnyxyfA+yYXlOao17iJnr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072448; c=relaxed/simple;
	bh=IpP2F3lWUTFrCZtkUJ3fvVhCFT1noQrwi4/6IxRJCsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Km7EhqMx2cDWliPikiyrdge5U6HEkcLoR+mZGbE3BTNbNe2UZlpuAHwopv2CC+6S9hldh17O89gEHxDuCp5dSsPEJljGXrX2t0kHnqKS3NAzc+x5Jx0Bk49DokJvuCOCfK4bvE1lLpTCxQvehVWF62omQ+eiJZqZhf0zKYybHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jmioQdSO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32A3440C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773072447; bh=auyBzhlqUYO96+vk8KXycuyCg5IcOb8m2GbAfTCJnCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jmioQdSOpAyfUi6XMxJxWxrvm2gi8zxU3WF6wi6b76kI8u4ZWW5EFlK0hN9BPU2Cu
	 Gmcm6JQWXuceErVijgMythgM9WQrm0JTIIIbmypWt43rcBA3QYLhAinW/zGuvtiIWz
	 3NSUpj0Xzj0CawzXOXLocFzVohRrbtcPn3knXeag6UaMHA1Jrl56fNMMf2GrvZebjX
	 nNowWu8TMpim6sQPXTLi4UMkiz3XMu3ME19qh0bnChHSXnwUMlUOPS62+d23sFtCZF
	 svJNEThmhNDC4NAPOUvKGqsO9cvX5twcWbshP+sAiU2//tcVgMWVXLohI23I22bsKj
	 9kk/Q3a3car1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32A3440C9C;
	Mon,  9 Mar 2026 16:07:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang LIU <tttturtleruss@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: Haoyang LIU <tttturtleruss@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] tools/docs/checktransupdate.py: add support for
 scanning directory
In-Reply-To: <20260308111314.27333-1-tttturtleruss@gmail.com>
References: <20260308111314.27333-1-tttturtleruss@gmail.com>
Date: Mon, 09 Mar 2026 10:07:26 -0600
Message-ID: <87zf4hvvep.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: D3E8723C8A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-78480-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,hust.edu.cn,linux.dev,kernel.org,linuxfoundation.org,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Haoyang LIU <tttturtleruss@gmail.com> writes:

> Origin script can only accept a file as parameter, this commit enables
> it to scan a directory.
>
> Usage example:
> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools

I've applied this, with one tweak:

> +    else:
> +        # check if the files are directories or files
> +        new_files = []
> +        for file in files:
> +            if os.path.isfile(file):
> +                new_files.append(file)
> +            elif os.path.isdir(file):
> +                # for directories, list all files in the directory and its subfolders
> +                new_files.extend(list_files_with_excluding_folders(
> +                    file, [], "rst"))

There's no reason to break that line there, so I took the liberty of
joining it back together.


Thanks,

jon

