Return-Path: <linux-doc+bounces-2530-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7347EE971
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 23:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF86F1C209FB
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 22:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A958911722;
	Thu, 16 Nov 2023 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="t0zoFcRv"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637F3127;
	Thu, 16 Nov 2023 14:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d6i/j7sl9K/e4ZF3LfPA+7jvTA/d+P4WyjlNqptN/k8=; b=t0zoFcRvjYhChzhzEEJmj64iyX
	3plkVMReYk5ppIA0GlgOtTg5/60YI19fUN/ZSqxl+Nl835+8zNDvVAw+pmU/4AxaeuzOIQLQ8vvYY
	O5al5MlHSIR74vz3pxzE69fnXGukuXL7epdMshBcQqgfWI0NH29os5OVEf3BF/9a1h9I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3l3b-000OUo-L4; Thu, 16 Nov 2023 23:41:55 +0100
Date: Thu, 16 Nov 2023 23:41:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 9/9] net: pse-pd: Add PD692x0 PSE controller
 driver
Message-ID: <8e077bbe-3b65-47ee-a3e0-fdb0611a2d3a@lunn.ch>
References: <20231116-feature_poe-v1-0-be48044bf249@bootlin.com>
 <20231116-feature_poe-v1-9-be48044bf249@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116-feature_poe-v1-9-be48044bf249@bootlin.com>

> +struct pd692x0_msg {
> +	struct pd692x0_msg_content content;
> +	u16 delay_recv;
> +};

> +	if (msg->delay_recv)
> +		msleep(msg->delay_recv);
> +	else
> +		msleep(30);

> +	if (msg->delay_recv)
> +		msleep(msg->delay_recv);
> +	else
> +		msleep(30);

> +	if (msg->delay_recv)
> +		msleep(msg->delay_recv);
> +	else
> +		msleep(30);
> +

As far as i can see with a quick search, nothing ever sets delay_recv?

	Andrew

