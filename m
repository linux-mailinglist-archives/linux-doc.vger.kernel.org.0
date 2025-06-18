Return-Path: <linux-doc+bounces-49571-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4351ADEFE5
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 16:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECED1885D8E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 14:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2E0280A5B;
	Wed, 18 Jun 2025 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eJxVsZDR"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FA1F94C;
	Wed, 18 Jun 2025 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257532; cv=none; b=KBbp4B+CPjI3YEAnqDKN+g2gs0ko9iRUD3mEe8x7511KUkrR5AVQOcblLvYKyeq1UopPvYm5wa4Ar3hkIeGvPvb5o0UdXLfVKadUIhX8eQaDRxtDR9U30w5GJ0GF9+rDFMNok/9pl7ecaFi7WRRHD7iCFnB2bHdWp2Ldz2MIj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257532; c=relaxed/simple;
	bh=CCQrJPOlFziorEEXSMhBVKx2aRs57L92oZtgRiKhIqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP9eTvB3ISmP2eCGl0/c/hi2Sdx5Hw8TyZDeZUT/AsSSwkG41VpzcycX6lgHekSj2A5UkTyTWAKnBcPjfHu5A5vCNHjO/7H/ehk3jpvRHu2/gJE9d/HjSOgHW6fm0Kt8LDjsXm+QCQ+MUb8Q39Ch4vE5ts1ySwkplUX4DY3tfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eJxVsZDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176A2C4CEE7;
	Wed, 18 Jun 2025 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750257530;
	bh=CCQrJPOlFziorEEXSMhBVKx2aRs57L92oZtgRiKhIqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJxVsZDRTKouuvSstIFHZTCgc7qzBVQwUEQir+LRrdHu+CjVbgoKy2m+kIaK4b/CP
	 aaDfkRyydh1wQSPETvwShjUUKninKcZ2cXavYMnxuIQ3f1OcdEvlAeCKjaGhXy2RfR
	 PzoOv8YTZVikaoB81rV+TndZMkgZFDHsOLH5i3T4=
Date: Wed, 18 Jun 2025 16:38:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself
 for Power
Message-ID: <2025061841-tidal-commode-3653@gregkh>
References: <20250614152925.82831-1-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614152925.82831-1-maddy@linux.ibm.com>

On Sat, Jun 14, 2025 at 08:59:24PM +0530, Madhavan Srinivasan wrote:
> Adding myself as the contact for Power
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index da6bf0f6d01e..34e00848e0da 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -290,6 +290,7 @@ an involved disclosed party. The current ambassadors list:
>    AMD		Tom Lendacky <thomas.lendacky@amd.com>
>    Ampere	Darren Hart <darren@os.amperecomputing.com>
>    ARM		Catalin Marinas <catalin.marinas@arm.com>
> +  IBM Power	Madhavan Srinivasan <maddy@linux.ibm.com>
>    IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
>    Intel		Tony Luck <tony.luck@intel.com>
>    Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
> -- 
> 2.49.0
> 
> 

I'll take this, thanks!

greg k-h

