Return-Path: <linux-doc+bounces-3975-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADE803CB1
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 19:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 112051C20AED
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 18:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE802F535;
	Mon,  4 Dec 2023 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3d6697L"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651A2E859;
	Mon,  4 Dec 2023 18:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E749C433C7;
	Mon,  4 Dec 2023 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701714090;
	bh=sp7GI5fp+q2JCa/7JJ6VUdsNhoncekwVODuziKrK9Q8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K3d6697LtSWIEgvvmcb2996/8foN9AiWh3NAjIC5TQB4fqgpENsRgmq2KEWTteMVd
	 SbhyRuhhOd88oO7LmZsZoiIWQ8Ir5Qg92EZOnBZCZ8pTT8gNTuLWDTSZwIpOqGBEM+
	 TDzJ5LQxfD2Lm1cqG9nOj2+l0aGjNwCFOyJqKGJowk5US3rbTUadA0KYuUSoKmZe+j
	 EFqB2SmtWk5KNbyNyxhvAe1N+8s77V1xg1Lm7DxeU5A76kuH2x0AfZyvv8LzWdR/dA
	 Y52Vbu9/TPrfIF6dpNeHaEQpJdaFZk4RQ3pC/gvY6uZ9r8MSNlBLnDJXoIWmk2Z/FV
	 D7TkBgE7eM8fA==
Date: Mon, 4 Dec 2023 10:21:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v1 4/6] tools/net/ynl: Add binary and pad
 support to structs for tc
Message-ID: <20231204102129.215e327b@kernel.org>
In-Reply-To: <m28r6a6iwp.fsf@gmail.com>
References: <20231130214959.27377-1-donald.hunter@gmail.com>
	<20231130214959.27377-5-donald.hunter@gmail.com>
	<20231201180646.7d3c851f@kernel.org>
	<m28r6a6iwp.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 Dec 2023 16:18:14 +0000 Donald Hunter wrote:
>   (b) value = msg.raw[offset : offset + m.len]
>
> Happy to go with whatever preference, though maximising whitespace per
> (b) follows python style _and_ C style?

Yup, style (b) does look the least surprising to my C-accustomed eyes,
so +1 on using that.

> Also happy to make it consistent across the file (in a separate patch)?

Follow up cleanup sounds good!

