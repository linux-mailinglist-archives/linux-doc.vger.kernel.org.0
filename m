Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98FF528672
	for <lists+linux-doc@lfdr.de>; Mon, 16 May 2022 16:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiEPOGm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 May 2022 10:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244438AbiEPOGV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 10:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC2023A71A
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652709978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C02Jr/UCyAq1WaiVEroFuXNF23GLqP5faeBDBUBpdVo=;
        b=FYd4oOq1031xF62p6SX+lGlgzK0q5kOG+GQTYmAmpKs2mNexR5Iw/DCErqB7gObKZQLqKa
        UNIGAiwE/B+41p1KefWXlMMhlliGyKM0VXjkinFVz0FZuXjTJng6jHSejkVn9Kr7gI9b8V
        tM6Ilf46UYZOmSPlAkfc67kClF6WKns=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-foEemo2wOPyR9VjoS-Iypw-1; Mon, 16 May 2022 10:06:17 -0400
X-MC-Unique: foEemo2wOPyR9VjoS-Iypw-1
Received: by mail-qv1-f69.google.com with SMTP id kl11-20020a056214518b00b0045a9af67efbso12202795qvb.18
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 07:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C02Jr/UCyAq1WaiVEroFuXNF23GLqP5faeBDBUBpdVo=;
        b=Jepj1Jt/OYIC2Ja/mqVBPxOQN1qSPDGgYWNhMepImAUvb9gvb4JTGdpbMoXoNqYS7l
         ZawwPMZnpXAcxfxR7CvUNmtC7TDVb7K1dyBwgYo+hq+pzfyKZHg/MZoXEYDzNsdL+l9z
         4wRkq/x0eOTEqoXjmVSvwR9xkZHdLzp+80mKrFBGxmi0CdYbMTXGthzXBwApbreEbjbM
         wMslBqJZ42anR+hJmPbt6t576ikBMH+v/8dbvuPQiOFsFDqBI/42wJQgCD+SDJcu5tq+
         OJTcFhY7dcMt/NViwcDpjMRF4TzQu2gU9nLwwuPx37MNOlCEAK5GbJ+XTEe60C3K341H
         Eq8A==
X-Gm-Message-State: AOAM530hRR7KSuJ8zNIPSYhxoNwQ06+oY4IvfBC/eOJM4RvkUCOPyMbz
        F6YYB1QXTjpFDbMLROVZ1BOi1j3dgZSdzqvyAmaIZoB5Hdca46EInoilIg//gvkBljwAki/uvUP
        7zOA32MVPANBMY+/vsgmz
X-Received: by 2002:ad4:5dc5:0:b0:45a:82c0:bc4a with SMTP id m5-20020ad45dc5000000b0045a82c0bc4amr15306796qvh.82.1652709977048;
        Mon, 16 May 2022 07:06:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeK4bI4hwRVpDCN8+j2vIlpM3R4Nn0BJi7TfSN2Dqsq24DwAdv9J6x56912JHzM7MP3DkjJA==
X-Received: by 2002:ad4:5dc5:0:b0:45a:82c0:bc4a with SMTP id m5-20020ad45dc5000000b0045a82c0bc4amr15306748qvh.82.1652709976709;
        Mon, 16 May 2022 07:06:16 -0700 (PDT)
Received: from [192.168.98.18] ([107.12.98.143])
        by smtp.gmail.com with ESMTPSA id p18-20020ac87412000000b002f3d23cf87esm5991936qtq.27.2022.05.16.07.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 07:06:15 -0700 (PDT)
Message-ID: <6431569f-fb09-096e-7a89-284a71aa5c0f@redhat.com>
Date:   Mon, 16 May 2022 10:06:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v3] bond: add mac filter option for balance-xor
Content-Language: en-US
To:     Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
Cc:     toke@redhat.com, Long Xin <lxin@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Veaceslav Falico <vfalico@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b32eb6656d5a54c0cde6277e9fc5c249c63489ca.1652463336.git.jtoppins@redhat.com>
 <4c9db6ac-aa24-2ca2-3e44-18cfb23ac1bc@blackwall.org>
 <da6bbb3b-344c-f032-fe03-5e8c8ac3c388@blackwall.org>
From:   Jonathan Toppins <jtoppins@redhat.com>
In-Reply-To: <da6bbb3b-344c-f032-fe03-5e8c8ac3c388@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/15/22 02:32, Nikolay Aleksandrov wrote:
> On 15/05/2022 00:41, Nikolay Aleksandrov wrote:
>> On 13/05/2022 20:43, Jonathan Toppins wrote:
>>> Implement a MAC filter that prevents duplicate frame delivery when
>>> handling BUM traffic. This attempts to partially replicate OvS SLB
>>> Bonding[1] like functionality without requiring significant change
>>> in the Linux bridging code.
>>>
>>> A typical network setup for this feature would be:
>>>
>>>              .--------------------------------------------.
>>>              |         .--------------------.             |
>>>              |         |                    |             |
>>>         .-------------------.               |             |
>>>         |    | Bond 0  |    |               |             |
>>>         | .--'---. .---'--. |               |             |
>>>    .----|-| eth0 |-| eth1 |-|----.    .-----+----.   .----+------.
>>>    |    | '------' '------' |    |    | Switch 1 |   | Switch 2  |
>>>    |    '---,---------------'    |    |          +---+           |
>>>    |       /                     |    '----+-----'   '----+------'
>>>    |  .---'---.    .------.      |         |              |
>>>    |  |  br0  |----| VM 1 |      |      ~~~~~~~~~~~~~~~~~~~~~
>>>    |  '-------'    '------'      |     (                     )
>>>    |      |        .------.      |     ( Rest of Network     )
>>>    |      '--------| VM # |      |     (_____________________)
>>>    |               '------'      |
>>>    |  Host 1                     |
>>>    '-----------------------------'
>>>
>>> Where 'VM1' and 'VM#' are hosts connected to a Linux bridge, br0, with
>>> bond0 and its associated links, eth0 & eth1, provide ingress/egress. One
>>> can assume bond0, br1, and hosts VM1 to VM# are all contained in a
>>> single box, as depicted. Interfaces eth0 and eth1 provide redundant
>>> connections to the data center with the requirement to use all bandwidth
>>> when the system is functioning normally. Switch 1 and Switch 2 are
>>> physical switches that do not implement any advanced L2 management
>>> features such as MLAG, Cisco's VPC, or LACP.
>>>
>>> Combining this feature with vlan+srcmac hash policy allows a user to
>>> create an access network without the need to use expensive switches that
>>> support features like Cisco's VCP.
>>>
>>> [1] https://docs.openvswitch.org/en/latest/topics/bonding/#slb-bonding
>>>
>>> Co-developed-by: Long Xin <lxin@redhat.com>
>>> Signed-off-by: Long Xin <lxin@redhat.com>
>>> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
>>> ---
>>>
>>> Notes:
>>>      v2:
>>>       * dropped needless abstraction functions and put code in module init
>>>       * renamed variable "rc" to "ret" to stay consistent with most of the
>>>         code
>>>       * fixed parameter setting management, when arp-monitor is turned on
>>>         this feature will be turned off similar to how miimon and arp-monitor
>>>         interact
>>>       * renamed bond_xor_recv to bond_mac_filter_recv for a little more
>>>         clarity
>>>       * it appears the implied default return code for any bonding recv probe
>>>         must be `RX_HANDLER_ANOTHER`. Changed the default return code of
>>>         bond_mac_filter_recv to use this return value to not break skb
>>>         processing when the skb dev is switched to the bond dev:
>>>           `skb->dev = bond->dev`
>>>      
>>>      v3: Nik's comments
>>>       * clarified documentation
>>>       * fixed inline and basic reverse Christmas tree formatting
>>>       * zero'ed entry in mac_create
>>>       * removed read_lock taking in bond_mac_filter_recv
>>>       * made has_expired() atomic and removed critical sections
>>>         surrounding calls to has_expired(), this also removed the
>>>         use-after-free that would have occurred:
>>>             spin_lock_irqsave(&entry->lock, flags);
>>>                 if (has_expired(bond, entry))
>>>                     mac_delete(bond, entry);
>>>             spin_unlock_irqrestore(&entry->lock, flags); <---
>>>       * moved init/destroy of mac_filter_tbl to bond_open/bond_close
>>>         this removed the complex option dependencies, the only behavioural
>>>         change the user will see is if the bond is up and mac_filter is
>>>         enabled if they try and set arp_interval they will receive -EBUSY
>>>       * in bond_changelink moved processing of mac_filter option just below
>>>         mode processing
>>>
>>>   Documentation/networking/bonding.rst  |  20 +++
>>>   drivers/net/bonding/Makefile          |   2 +-
>>>   drivers/net/bonding/bond_mac_filter.c | 201 ++++++++++++++++++++++++++
>>>   drivers/net/bonding/bond_mac_filter.h |  37 +++++
>>>   drivers/net/bonding/bond_main.c       |  30 ++++
>>>   drivers/net/bonding/bond_netlink.c    |  13 ++
>>>   drivers/net/bonding/bond_options.c    |  81 +++++++++--
>>>   drivers/net/bonding/bonding_priv.h    |   1 +
>>>   include/net/bond_options.h            |   1 +
>>>   include/net/bonding.h                 |   3 +
>>>   include/uapi/linux/if_link.h          |   1 +
>>>   11 files changed, 373 insertions(+), 17 deletions(-)
>>>   create mode 100644 drivers/net/bonding/bond_mac_filter.c
>>>   create mode 100644 drivers/net/bonding/bond_mac_filter.h
>>>
>>
> [snip]
> 
> The same problem solved using a few nftables rules (in case you don't want to load eBPF):
> $ nft 'add table netdev nt'
> $ nft 'add chain netdev nt bond0EgressFilter { type filter hook egress device bond0 priority 0; }'
> $ nft 'add chain netdev nt bond0IngressFilter { type filter hook ingress device bond0 priority 0; }'
> $ nft 'add set netdev nt macset { type ether_addr; flags timeout; }'
> $ nft 'add rule netdev nt bond0EgressFilter set update ether saddr timeout 5s @macset'
> $ nft 'add rule netdev nt bond0IngressFilter ether saddr @macset counter drop'
> 

I get the following when trying to apply this on a fedora 35 install.

root@fedora ~]# ip link add bond0 type bond mode balance-xor 
xmit_hash_policy vlan+srcmac
[root@fedora ~]# nft 'add table netdev nt'
[root@fedora ~]# nft 'add chain netdev nt bond0EgressFilter { type 
filter hook egress device bond0 priority 0; }'
Error: unknown chain hook
add chain netdev nt bond0EgressFilter { type filter hook egress device 
bond0 priority 0; }
                                                          ^^^^^^
[root@fedora ~]# uname -a
Linux fedora 5.17.5-200.fc35.x86_64 #1 SMP PREEMPT Thu Apr 28 15:41:41 
UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

