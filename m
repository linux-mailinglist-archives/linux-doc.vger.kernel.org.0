Return-Path: <linux-doc+bounces-13908-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B88A15AF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Apr 2024 15:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CB1C1C21FCF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Apr 2024 13:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D0314D29A;
	Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MAIf9ifI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F5640C09;
	Thu, 11 Apr 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712842516; cv=none; b=cuZOZaAGridjDFwJIqCLY97CwF0+6TceO3pkeDYX6+KHJem4DWNPn23Y8E6Xv8svZpCs7XAuRRH4FTB6mEpwnUeQCuc7JPtiswMl77WMAnIogClOwR7Pz3AILKxY2BtJSMf6nCSbBiLRvcLqx0M3Jx4qi7zX4FWBqKi7VMoUy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712842516; c=relaxed/simple;
	bh=FpMFblY+SMwzmG0EVkWbFNPm/dttxcnD0twoO0ekIb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4NWsSFoRsgRqys2/NgcMs6n9KrDyjZukw/hZlDIA6kVZEGN05Y5NHGZg4P3LKXwn9FPMDWk6SU7FIL1Dbcnw4qz62GjFM6MxnZAJvG+3wRtL62rI4D4TS5Z6x1M3vCQmNtfi8dWIn9zPQN/q4gAExk4o0RpzWztqhqhNXGJNs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MAIf9ifI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C75C072AA;
	Thu, 11 Apr 2024 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712842515;
	bh=FpMFblY+SMwzmG0EVkWbFNPm/dttxcnD0twoO0ekIb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAIf9ifI+Ws74CbIMFZkPh+kXJjJDc1De1FOESzfzr+su5lpJ0mmbG0NQNV+znNK1
	 7hNqomDtryq8pECnYWWJOC9lrpV4Xt7NTwDHpyFL+pNUtFp4fUECAl2RuEsQkEe9TI
	 HDBgQUKqT4UKEUdHNeOkqYqsiVOwlg5UofcYKyKc=
Date: Thu, 11 Apr 2024 15:35:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, wine-devel@winehq.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arkadiusz Hiler <ahiler@codeweavers.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 03/30] ntsync: Introduce NTSYNC_IOC_SEM_POST.
Message-ID: <2024041141-renter-boring-9ff2@gregkh>
References: <20240329000621.148791-1-zfigura@codeweavers.com>
 <20240329000621.148791-4-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329000621.148791-4-zfigura@codeweavers.com>

On Thu, Mar 28, 2024 at 07:05:54PM -0500, Elizabeth Figura wrote:
> This corresponds to the NT syscall NtReleaseSemaphore().
> 
> This increases the semaphore's internal counter by the given value, and returns
> the previous value. If the counter would overflow the defined maximum, the
> function instead fails and returns -EOVERFLOW.
> 
> Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
> ---
>  drivers/misc/ntsync.c       | 72 +++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/ntsync.h |  2 ++
>  2 files changed, 71 insertions(+), 3 deletions(-)

As the first 3 patches here looked good to me (see my comments on patch
4), I took them to save you the trouble of constantly refreshing them.

thanks,

greg k-h

