Return-Path: <linux-doc+bounces-4571-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF580B0EC
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 01:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAC141C20B78
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 00:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF14F38C;
	Sat,  9 Dec 2023 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LtCdjgIR"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944C5172A;
	Fri,  8 Dec 2023 16:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+Bla+2D/SmF77m+DIEiC5p/+uiJpt3KbwhPpcNnWVmQ=; b=LtCdjgIR9u3vR7VjCKN9E0TxGU
	LynRo1fqak3yHiqC1RGbnc9nW52U5I+pjiT5QWqNmMctDBx8FBcevYk6rx602TVPZxEYvAKD2wxgn
	/GTE0yNx4XAYFca4oiZL2H6IKE+bhIjvIQ4AxgDhs1Z6caShufvSzHAhYUCUnzaS6zgYYNMXGrkgn
	zaxdrx5wL7E7TNR93x9ZeF0xUpkvw0xGAS9V8lnEELhzKVOPVXot38f9kgj2tpYmFXubSvVhO/Mfg
	mdzy5uDFmD/M9Nu3HEc/+kjY7XGZyAS+cx0pCen4XhtF0N6OlIt0vtRpe6Lq72PrjoHUSI92D2gBq
	9A3dB8tQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rBl9E-00GopX-1P;
	Sat, 09 Dec 2023 00:24:48 +0000
Message-ID: <9e6c1e79-7728-42b9-b968-2e9d030d1c27@infradead.org>
Date: Fri, 8 Dec 2023 16:24:48 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Rework the top-level process page
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <87msuk2pu8.fsf@meer.lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87msuk2pu8.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/23 16:15, Jonathan Corbet wrote:
> +Other material
> +--------------
> +
> +Here are some other guides to the community that are of interest to most
> +developers are:

eh?

-- 
~Randy

