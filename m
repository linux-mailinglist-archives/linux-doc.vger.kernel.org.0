Return-Path: <linux-doc+bounces-76396-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L9HG9JBmGneDwMAu9opvQ
	(envelope-from <linux-doc+bounces-76396-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 12:13:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19E1672D1
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 12:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2A0530221E2
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 11:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E495D341AD6;
	Fri, 20 Feb 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgI5id6u"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3B267B89;
	Fri, 20 Feb 2026 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585998; cv=none; b=M1qDwT4o/agsO3kF2y34NUNiat6T6zE7CQ1cnCP04VmandZqQJlZ2LD2LFi3OgX3X7E/+um1xGDXH3nQfM2l3nQ+4iEZe5qQKHO4vy/qkP16GPOmfTsccEnv9LKcmg5Piaq8yNA0bvqvkPkPJn5Aws6PYMXdCzcv6pcpBE5hWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585998; c=relaxed/simple;
	bh=vs9mtD2LKa45Fxlt9Q6Eqd0MYrNkieEY89fd/Jb2+rU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igjUtS3iTDIL6/uw82cwHZ9TUBHpnSbfQ1xVhTsd2Pc8wNvNeaKmxSVbqmAHiP3iBQ3SZ37h5bnXKG17Pijyho5vB1c6PfCIItSo/7TgfZ2Iwq8G2T02iV+I9gSYgDdSkWiXSoD8h4nDjPPewDYtNrUkNiyDzIPYz7yk0mAp89w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgI5id6u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C874AC116C6;
	Fri, 20 Feb 2026 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771585998;
	bh=vs9mtD2LKa45Fxlt9Q6Eqd0MYrNkieEY89fd/Jb2+rU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KgI5id6ulgZW7y8YrvliueO9nlADvWAPrGvgY9AhqzPR4uopvZrVjTjmf7E3TXDlt
	 pw+POZregMGY3CbrTNY8NGVPoOuTRm5GzsF45W2cNlU4plwfYwQdoPv6R0eTiM4HvU
	 b2+20ZFLzBWP8lv89iQLcsCPF0YjyIujPX4SIznfkWntnesSCGTg682Ff8nKI9ScXi
	 PNCXKi79QIaCgE2d6XD89VxR7FETxzcY6jv/JmsSIv7daZpYDyLkb6hiSc7WAPFS5R
	 dE4rcPdEJxM8X6uPf7MJs6YMMHnrVR5bt6XBVOR4oSTCmiOHUQsfOHkmMRkUJzh09u
	 NQS0VZ3xrR1VA==
Date: Fri, 20 Feb 2026 11:13:07 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <michael.hennerich@analog.com>, <nuno.sa@analog.com>,
 <eblanc@baylibre.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <corbet@lwn.net>, <marcelo.schmitt1@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 1/8] dt-bindings: iio: adc: adi,ad4030: Reference
 spi-peripheral-props
Message-ID: <20260220111307.0cb4b6e0@jic23-huawei>
In-Reply-To: <4cec105bd339aa67b3e1cd1eba71a8dd2f3a389e.1771253601.git.marcelo.schmitt@analog.com>
References: <cover.1771253601.git.marcelo.schmitt@analog.com>
	<4cec105bd339aa67b3e1cd1eba71a8dd2f3a389e.1771253601.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76396-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,baylibre.com,kernel.org,lwn.net,gmail.com,microchip.com];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE19E1672D1
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 11:59:10 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> AD4030 and similar devices all connect to the system as SPI peripherals.
> Reference spi-peripheral-props so common SPI peripheral can be used from
> ad4030 dt-binding.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
As this stands on it's own, I've picked it up now.

Applied to the testing branch of iio.git which will get rebased on rc1.

I'm having one of those days where there are too many things
in the 'in progress queue' so I'm nibbling off anything I can.

Jonathan

> ---
> No changes in v9.
> 
>  Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> index e22d518135f2..29e266865805 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> @@ -20,6 +20,8 @@ description: |
>    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-24_ad4632-24.pdf
>    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-16-4632-16.pdf
>  
> +$ref: /schemas/spi/spi-peripheral-props.yaml#
> +
>  properties:
>    compatible:
>      enum:


