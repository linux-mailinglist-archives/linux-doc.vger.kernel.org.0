Return-Path: <linux-doc+bounces-30896-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD459CF57B
	for <lists+linux-doc@lfdr.de>; Fri, 15 Nov 2024 21:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE16E1F29B11
	for <lists+linux-doc@lfdr.de>; Fri, 15 Nov 2024 20:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38218734F;
	Fri, 15 Nov 2024 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrQNil5K"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014A10F2;
	Fri, 15 Nov 2024 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731701248; cv=none; b=foKiHgPTKd3g2TPKQsdixlQIGJgJWIHvQataeiYEaL5c7AQKVpypU9+amxioJfubUrv9CQTudo0AX3ILqlA1g5o4aM+uapD8GOJn5PGvW4QCM7L6XyYY2pafxaJb7I1boTA2Q3MuBHS3gPOXdHJANgsWY9i6XP8eGyB7xvn+mKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731701248; c=relaxed/simple;
	bh=UF+En2UR+hcyx7xBorsCQCwbjYXrswXlpaJGL54KlQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQZ8tQdN7TQhPPmNRQtejPrztF3TuzLR4TTJAhT3ETQ29GesqNuKWCyFJmsAtVsvueDkL2tnzqtLz7dkbuISXWf1qqPsRFjZvk3MBtV6M8dVgm9/SneBAA+GDc5DpuGzyAHUU27siDH2nSE7Yxzz1yJh7F13C118im8SsZgTgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrQNil5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF73C4CED4;
	Fri, 15 Nov 2024 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731701246;
	bh=UF+En2UR+hcyx7xBorsCQCwbjYXrswXlpaJGL54KlQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrQNil5KnI1PNp1SB8Cr8sTdzS8gF/1FghWDjpMMyT9KYFSz30OX61+Bmw+TFF3H9
	 HKJyY4m+IjJulogw0dKIw9tJSbITmCCNuIpkqFA9PoxmCA2hWyWBmNgemnvS2Zei57
	 aWy1ZlQFLaGH+aBhhwQqdbguPUlJv3paUsLXJpVnGHGH6+YS0Cdac7DMsFMjlgK6pM
	 3AyhJjzTjrCeOJiHvNUCKxnQzcCXQMdn9W9W1Lx4jw617L2t9v1AewzgZ/iCRmdUgr
	 dSACH/oMF91VBJse28/dgrNwaLIINVtRmsn1tQHixNy2lljxW3tNoTGViB65sytgCl
	 nn14N5lZBBjUg==
Date: Fri, 15 Nov 2024 12:07:23 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Taehee Yoo <ap420073@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com,
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com,
	andrew+netdev@lunn.ch, hawk@kernel.org, ilias.apalodimas@linaro.org,
	ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
	dw@davidwei.uk, sdf@fomichev.me, asml.silence@gmail.com,
	brett.creeley@amd.com, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, kory.maincent@bootlin.com,
	maxime.chevallier@bootlin.com, danieller@nvidia.com,
	hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com,
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com,
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org,
	jdamato@fastly.com, aleksander.lobakin@intel.com,
	kaiyuanz@google.com, willemb@google.com, daniel.zahka@gmail.com
Subject: Re: [PATCH net-next v5 2/7] net: ethtool: add tcp_data_split_mod
 member in kernel_ethtool_ringparam
Message-ID: <Zzep-7lOEfjXxsCs@x130>
References: <20241113173222.372128-1-ap420073@gmail.com>
 <20241113173222.372128-3-ap420073@gmail.com>
 <20241114202239.3c80ef6a@kernel.org>
 <CAMArcTWfxiKWghy3cFEL4rj7=VKku_Sm4W9pVWk39TEae1fyAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMArcTWfxiKWghy3cFEL4rj7=VKku_Sm4W9pVWk39TEae1fyAw@mail.gmail.com>

On 16 Nov 02:17, Taehee Yoo wrote:
>On Fri, Nov 15, 2024 at 1:22 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Wed, 13 Nov 2024 17:32:16 +0000 Taehee Yoo wrote:
>> > When tcp-data-split is UNKNOWN mode, drivers arbitrarily handle it.
>> > For example, bnxt_en driver automatically enables if at least one of
>> > LRO/GRO/JUMBO is enabled.
>> > If tcp-data-split is UNKNOWN and LRO is enabled, a driver returns
>> > ENABLES of tcp-data-split, not UNKNOWN.
>> > So, `ethtool -g eth0` shows tcp-data-split is enabled.
>> >
>> > The problem is in the setting situation.
>> > In the ethnl_set_rings(), it first calls get_ringparam() to get the
>> > current driver's config.
>> > At that moment, if driver's tcp-data-split config is UNKNOWN, it returns
>> > ENABLE if LRO/GRO/JUMBO is enabled.
>> > Then, it sets values from the user and driver's current config to
>> > kernel_ethtool_ringparam.
>> > Last it calls .set_ringparam().
>> > The driver, especially bnxt_en driver receives
>> > ETHTOOL_TCP_DATA_SPLIT_ENABLED.
>> > But it can't distinguish whether it is set by the user or just the
>> > current config.
>> >
>> > The new tcp_data_split_mod member indicates the tcp-data-split value is
>> > explicitly set by the user.
>> > So the driver can handle ETHTOOL_TCP_DATA_SPLIT_ENABLED properly.
>>
>> I think this can work, but it isn't exactly what I had in mind.
>>
>> I was thinking we'd simply add u8 hds_config to
>> struct ethtool_netdev_state (which is stored inside netdev).
>> And update it there if user request via ethnl_set_rings() succeeds.
>>
>> That gives the driver and the core quick and easy access to checking if
>> the user forced the setting to ENABLED or DISABLED, or didn't (UNKNOWN).
>>
>> As far as the parameter passed to ->set_ringparam() goes we could do
>> (assuming the new fields in ethtool_netdev state is called hds):
>>
>>         kernel_ringparam.tcp_data_split =
>>                 nla_get_u32_default(tb[ETHTOOL_A_RINGS_TCP_DATA_SPLIT],
>>                                     dev->ethtool->hds);
>>
>> If the driver see UNKNOWN it means user doesn't care.
>> If the driver sees ENABLED/DISABLE it must comply, doesn't matter if
>> the user requested it in current netlink call, or previous and hasn't
>> reset it, yet.
>>

This complicates things, drivers shouldn't store previous uncommitted "wanted" values.
We have wanted_features for that, and I don't think it's smart to have yet another
wanted_features mechanism, let's keep it simple, any explicit config by
ethtool should either be immediately committed or returned as error to
user and driver will only reflect the old/current value in future get requests.

HDS can conflict with many other features e.g XDP/LRO/rx_copy_break/MTU
limitations etc ...

>> Hope this makes sense...
>
>Thank you so much for the details!
>I will try to use ethtool_netdev_state instead of this approach.
>
>Thanks a lot!
>Taehee Yoo
>

