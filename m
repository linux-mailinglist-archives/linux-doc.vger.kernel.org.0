Return-Path: <linux-doc+bounces-23287-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6C957CAE
	for <lists+linux-doc@lfdr.de>; Tue, 20 Aug 2024 07:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182D21F22EE8
	for <lists+linux-doc@lfdr.de>; Tue, 20 Aug 2024 05:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240573AC36;
	Tue, 20 Aug 2024 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WuVe7Fnz"
X-Original-To: linux-doc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D761EEAE;
	Tue, 20 Aug 2024 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724131091; cv=none; b=KOlT3S+Q27ZyXLdSqHQOwYw5RWOr91sQjIHVLbkMLu+v0FQcUvcZ6XXQrqEiQGYRQ8s4WYhwytH8N2JSg1cPgPFsZb0KkIe4iDrAIcKuSCqgpLN+haKvOSKvmxWduQhwdXTBaAjJg7FktcTPKTaOmfs9kDQlqeHoRUM58Q/vx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724131091; c=relaxed/simple;
	bh=bUDVQLnkLJEQkKBm6/sZU+9KnW5GietWMZJOk87ImLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dvwm4sg80jRHQ/gcMqrl/GIb5/jdolsn0ehJMRm9+RE46O+gXAIzDKBCxG1Xi71w5XuxVqRv6s0XEkJ2l57csyFI0eBEVKkiIHRDB8xqZnXtJqcfXy7h7uePADBERlfJm8g0WOZlbuuHU7YPKMML/IrN0GeHvd14v4sCFjS5PXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WuVe7Fnz; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=LlR3GcMEdk+441x++dgGYDzxQyfwgaa6hhPPULnpciM=; t=1724131089;
	x=1724563089; b=WuVe7FnzYdnd59syMxugF1vIyu3Jmb2PplCfsEd8kKFduXTb2OQJSsORsa2ul
	u7Q804XkrhyNmBUWc6uJ+q9x9zk0MXr73UFgeMAcrb+CLSxi9uZH+HvefNX9QiHRnlhOGUsxLyCi+
	j69MciY5Ecabz0AadSi27T/J14/19x7naOzui0kEJSbv5vU+GgdmwDm1uljXcJX4Pw4TZHeg/hujP
	0ypVK/I+w5bz4jecBMK0lsff44y4HQF9afoGdMCznEWyj1KGQjEqzItxf5zawlTFQcPESHYwnQS6S
	Mu7mxiOM/hHBP9EEScxbFofkmXRIggsWfjPwpvzOIWY+EprvJQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sgHFr-0001tD-2H; Tue, 20 Aug 2024 07:18:03 +0200
Message-ID: <c91950a3-a3d6-4b12-b65a-355b214ca9fc@leemhuis.info>
Date: Tue, 20 Aug 2024 07:18:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: Fix grammar and phrasing errors in
 reporting-issues.rst
To: SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240816104902.123452-1-surajsonawane0215@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <20240816104902.123452-1-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1724131089;803ce9df;
X-HE-SMSGID: 1sgHFr-0001tD-2H

On 16.08.24 12:49, SurajSonawane2415 wrote:
> Fix grammatical errors and improve phrasing in the `reporting-issues.rst`
> documentation file. These changes enhance readability and ensure the
> accuracy of the instructions provided.
> 
> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>

Ha, moving that "the" in the last change would not have been necessary
now that the "be" is gone, but whatever:

Acked-by: Thorsten Leemhuis <linux@leemhuis.info>

Thx again for this. Ciao, Thorsten

> ---
> V3 -> V4: Adjust line wrapping to split the long line properly.
> V2 -> V3: Re-added the fix for the line: "That's why you might be need to uninstall the".
> V1 -> V2: Removed the unwanted change to the line: "try search terms like".
> 
>  Documentation/admin-guide/reporting-issues.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 2fd5a030235a..d0e645fc845a 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -56,7 +56,7 @@ developers. It might be all that's needed for people already familiar with
>  reporting issues to Free/Libre & Open Source Software (FLOSS) projects. For
>  everyone else there is this section. It is more detailed and uses a
>  step-by-step approach. It still tries to be brief for readability and leaves
> -out a lot of details; those are described below the step-by-step guide in a
> +out a lot of details; those are described below in the step-by-step guide in a
>  reference section, which explains each of the steps in more detail. 
> 
>  Note: this section covers a few more aspects than the TL;DR and does things in
> @@ -299,7 +299,7 @@ face, even if they look small or totally unrelated. That's why you should report
>  issues with these kernels to the vendor. Its developers should look into the
>  report and, in case it turns out to be an upstream issue, fix it directly
>  upstream or forward the report there. In practice that often does not work out
> -or might not what you want. You thus might want to consider circumventing the
> +or might not be what you want. You thus might want to consider circumventing the
>  vendor by installing the very latest Linux kernel core yourself. If that's an
>  option for you move ahead in this process, as a later step in this guide will
>  explain how to do that once it rules out other potential causes for your issue.
> @@ -472,8 +472,8 @@ before proceeding.
>  Note, you might not be aware that your system is using one of these solutions:
>  they often get set up silently when you install Nvidia's proprietary graphics
>  driver, VirtualBox, or other software that requires a some support from a
> -module not part of the Linux kernel. That why your might need to uninstall the
> -packages with such software to get rid of any 3rd party kernel module.
> +module not part of the Linux kernel. That's why you might need to uninstall
> +the packages with such software to get rid of any 3rd party kernel module.
>  
>  
>  Check 'taint' flag

