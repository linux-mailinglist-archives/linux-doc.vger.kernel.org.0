Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E9E782B17
	for <lists+linux-doc@lfdr.de>; Mon, 21 Aug 2023 16:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbjHUODC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Aug 2023 10:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbjHUODB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 10:03:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5147DC2;
        Mon, 21 Aug 2023 07:03:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3197808bb08so3148219f8f.2;
        Mon, 21 Aug 2023 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692626579; x=1693231379;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/R3tuyhTy1dIqh36B++R19xvH0q9egrvUaY90xCKCrM=;
        b=lcLkVmPKeYIoBi3yqk/p67iN2weyBsttNN/w9mUVAD8cYrkIHFFzaQGAT883LTykmc
         BhZE/9HNpKm6UakRpTNnjEg3mw0wnKE0xpgbZ6DsrTcNZtutuEwNVm3rOlYs62imq5F/
         JlFTG2aDiwyFIfK5Rp2wEGwZ4LHaby02iv+voZn/dapFgNyNngXQ2xUcdRSK18TGt7Si
         gAHAJ7AmK/ifCYXJ7YGLIr0pLMQkvvgOVgi16lMS2QfyuJIxLrcuYztnNrHhn67xY7TX
         f25n68GQGnouf95ZG2QLfk8+hFegvO/GYaAKliXJXzoJgvj7984RsEF/QgO2AX8mwceg
         Xlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692626579; x=1693231379;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R3tuyhTy1dIqh36B++R19xvH0q9egrvUaY90xCKCrM=;
        b=MGpW333UHxU+zRXEEreKxrotErphe4dmd6nxLu96jZWPA6n40g8OsNQpXumhcnHNMZ
         VbEtmvo/hwo5aj8L8juYE+TNp5zIBDaZ8eR8WMt4UxwXxz5iL59xwZvF6iYUGiJPV9h0
         BOdoEmaBJmoEh9cehqMOnxmDtM9M6ubK02xAap6AQLduOdUF2s5gVQ4vROSdA5kc7L9y
         H96ewIGdb55hTcHWFV2aYAwMGbmYlIV6ejx7IdOzPJD6Pu/LXGryEeX+7n/atBrHpro+
         uO55YJQvTJW9Um/hg43leCANRw2qBry6QaW+smlG1lkXf6kPoxkW4boxR0nZOwotD7EQ
         WZ3g==
X-Gm-Message-State: AOJu0Yw6CDTlEmkK3eNbjWrGeTfYwmXB7ULaav01+s4wUxGmY96qFcJ9
        oEshmMW/gTH3HiWJoIw5B2Q=
X-Google-Smtp-Source: AGHT+IGlnNBEMu/xWI+NfVQ7xMln6KdV8bEYtCVyXEHDJcw2ukJnRciEu29meeT7u5JtD+KK4FQw+Q==
X-Received: by 2002:a5d:4a06:0:b0:317:5e73:7594 with SMTP id m6-20020a5d4a06000000b003175e737594mr4511136wrq.28.1692626578369;
        Mon, 21 Aug 2023 07:02:58 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18ac:90b7:a4b7:83f8])
        by smtp.gmail.com with ESMTPSA id e4-20020adffc44000000b00317ddccb0d1sm12620352wrs.24.2023.08.21.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:02:57 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 06/10] tools/net/ynl: Add support for
 netlink-raw families
In-Reply-To: <20230817181828.76ac2c11@kernel.org> (Jakub Kicinski's message of
        "Thu, 17 Aug 2023 18:18:28 -0700")
Date:   Mon, 21 Aug 2023 15:00:14 +0100
Message-ID: <m24jksijgx.fsf@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-7-donald.hunter@gmail.com>
        <20230816082908.1365f287@kernel.org> <m2cyzmhw50.fsf@gmail.com>
        <20230817181828.76ac2c11@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Thu, 17 Aug 2023 10:10:35 +0100 Donald Hunter wrote:
>> > Looks good, but do we also need some extra plumbing to decode extack
>> > for classic netlink correctly?  Basically shouldn't _decode_extack()
>> > also move to proto? Or we can parameterize it? All we really need there
>> > is to teach it how much of fixed headers parser needs to skip to get to
>> > attributes, really (which, BTW is already kinda buggy for genl families
>> > with fixed headers).  
>> 
>> I have been working on the assumption that extack responses don't
>> include any fixed headers. I have seen extack messages decoded correctly
>> for classic netlink, here with RTM_NEWROUTE:
>> 
>> lib.ynl.NlError: Netlink error: Invalid argument
>> nl_len = 80 (64) nl_flags = 0x300 nl_type = 2
>>   error: -22  extack: {'msg': 'Invalid prefix for given prefix length'}
>> 
>> Is there something I am missing?
>
> I'm thinking of extack messages carrying offsets in addition to the 
> textual error message. NLMSGERR_ATTR_OFFS or NLMSGERR_ATTR_MISS_NEST.
>
> In that case ynl will try to re-parse its own message via
> _decode_extack_path() to resolve from the offset to what attribute
> was there. See the commit message on a552bfa16:
>
>     lib.ynl.NlError: Netlink error: Numerical result out of range
>     nl_len = 108 (92) nl_flags = 0x300 nl_type = 2
>             error: -34      extack: {'msg': 'integer out of range',...
>                                      'bad-attr': '.ifindex'}
>
> I mean the "bad-attr" thing.
>
> I think it works out of sheer luck here, we happen to skip over 
> the fixed header because it looks like a 0-length attribute?

You're right, sheer luck, and maybe only for some values of dp-ifindex.
When I tried to reproduce your test in commit a552bfa16, with a value of
dp-ifindex = 5, then ynl goes into an infinite loop trying to read a
zero length nlattr.

As you say, I'll need to rework the extack handling to account for fixed
headers. At a minimum _decode_extack will need to use nlproto.decode()
and needs to learn to skip the fixed header.

Apologies for being slow to catch up with you on this. Failing to grok
that _decode_extack is decoding the request, not the response.


