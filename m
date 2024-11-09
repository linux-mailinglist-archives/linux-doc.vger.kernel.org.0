Return-Path: <linux-doc+bounces-30368-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6859C29C8
	for <lists+linux-doc@lfdr.de>; Sat,  9 Nov 2024 04:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DEB3282E8A
	for <lists+linux-doc@lfdr.de>; Sat,  9 Nov 2024 03:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DBB139D;
	Sat,  9 Nov 2024 03:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="VU0/KTrC"
X-Original-To: linux-doc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564745BE3
	for <linux-doc@vger.kernel.org>; Sat,  9 Nov 2024 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731124763; cv=none; b=Ia9E6mx/kLLz+iYpuQJ+3Vs0q1ZX3JgP8UnrGay/VCWzvUdH5EmTQGLnl6yGEBIpPRV3D1ZJlNfTNae0xYXide85lt8EzHhlbnTU7DUlS6sbBHz/Ts7IMTlN9pFYZoXG4eZtLB35uEBQL9m9lxqKi4gaDCeZKXcWWzJrpsd/6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731124763; c=relaxed/simple;
	bh=MuUHmXGr8JXXU11U0zA3AH5ebUBQtLudPHAX4pJOYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6gMWRBI9tflwR6zUhvfjqDQt4ZmQjrvm8U9+J4+fja7W0pgTTxlSpMKCPqlJf3LSx3MKmhfdkcM+52s69erCF+TCxXjJIyWufcOOZQ3EgOueI5sqHvCpjmlhlCCvIp1AaIWhRSAr4TFZWPwyzpUGEUPnNtcJg4IVwaF+WiZLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=VU0/KTrC; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-82-224.bstnma.fios.verizon.net [173.48.82.224])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A93x4wg010849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 22:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1731124747; bh=816N1sk5E3DW7glLrjhiANpEjK5lmhpur2scZjvvw/I=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=VU0/KTrCBOp+nuWiJj1E9sqmkR0ZfOEGE6f6m6D58SBbLNewrwuRv2+1KwAeEn6Zq
	 LLH9AhjSrtYS1GFaaWXCAESDw3pEmr9Af1qx3tAZZX9SPjuwoWWTfAQIBF/d7xNwHX
	 X/0Kh73JTSOcwy7Bm2QzVESF5FLXGtKwAbGs94dnP9zrVb89kDWUyWwPwQrqCMxK8z
	 iEsmiLgr/LxFvE2HySe2RLyi+snopc+CZcVhuHRHchtReMSkpg7lDIVp9g/GgWiahg
	 2KZNh6XQlDnoCf0PqSRlTJWkyzMqPMKkH/sN8Wz2pUaJ5wcZLeoiES5Zr0b12aSD6U
	 DaRs6EFti7r/Q==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 10E0315C02BF; Fri, 08 Nov 2024 22:59:04 -0500 (EST)
Date: Fri, 8 Nov 2024 22:59:04 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
Message-ID: <20241109035904.GA21941@mit.edu>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108161853.12325-1-skhan@linuxfoundation.org>

On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
> The Code of Conduct committee's goal first and foremost is to bring about
> change to ensure our community continues to foster respectful discussions.
> 
> In the interest of transparency, the CoC enforcement policy is formalized
> for unacceptable behaviors.
> 
> Update the Code of Conduct Interpretation document with the enforcement
> information.
> 
> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Acked-by: Theodore Ts'o <tytso@mit.edu>


