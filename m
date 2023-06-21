Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9230D7382D9
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jun 2023 14:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjFULxc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Jun 2023 07:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjFULx3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 07:53:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F88C10F6
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 04:53:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-311275efaf8so4318616f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1687348406; x=1689940406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWVbrBam1C3VHFxu2Gp+YYi2JGVprd45HzgEWZLjxNI=;
        b=m4NkOGZMB4TCMVjcELrLjRRubYuX8F1IGWT0PfmzIQSLSjXRajmdfJhKqn4XFjJL+Q
         eRCVpVSB9sTomVtJdbAvTYMqrY35FdnFXS+piL/ZI7D4zTYkVVedZ4O45KfmXLmZUmSo
         dyPWKtwtIy+G5RM0B3ciFRoFRa0lqxrvgkrp2/PjoYCGJsHAq2Wq8zqQYRzOVhtfVYOP
         bEEsyZvxH68MlHiWvEyHpHQNL866S4AvvqoMfRvV3ekbZI6I04U0pddSwK6oWF392SYg
         W5HB6vUWMe46K8v9Oi+tVhbAblBpJPnZ0bxSwYrNwrPDxP9NpOOKqSd0D/S3sPMWblaF
         86gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687348406; x=1689940406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWVbrBam1C3VHFxu2Gp+YYi2JGVprd45HzgEWZLjxNI=;
        b=VC7lFdDyHAsNegProtHCnlRZkl3MtOzit++z6SrDlDGcC30wN6Tp3M+I2XFfhrVIUT
         UKqpUVmYkv1sAxZum8jww3HauXbLkRMXuSO7sZfP1FY245OUunzhRD0GyxF+Vmj/ntAx
         zoGSq2aSPkp/QMM8x63Giz6RQtob0P47J2Io4yFPef7tJoZ5m+92gJ4mKb+uzE5wp0p4
         Gxo3u/5ZXmRcMyHfXfd42YHELsTbMPF3ipGIqtDjxQawT6vm/UwC5e/9oWk/vZBNJ4Bs
         uTqLuWcT8feOWMChFl5FfLEp3Yk3CeGe3b9BMKUG2/jCQCQL9NROszaOznKSnDYmMt0B
         ikxA==
X-Gm-Message-State: AC+VfDz/HNvoShHUSTmuOjQ8G3ti7bD8oA+QragQ1IXFtBuDZ8Dai73m
        zdtWH+QA28vsqPv6uE92vW3HZA==
X-Google-Smtp-Source: ACHHUZ5c8gzF87ZPOzSygN9j53VtOdiY9gi5DBzBT3zEwY7bTIXpP8dgWGQLA/+KsDQtBIq8+e5vDw==
X-Received: by 2002:a05:6000:1252:b0:311:1712:621 with SMTP id j18-20020a056000125200b0031117120621mr10087707wrx.46.1687348406491;
        Wed, 21 Jun 2023 04:53:26 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id b8-20020adff248000000b003063772a55bsm4283305wrp.61.2023.06.21.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:53:25 -0700 (PDT)
Date:   Wed, 21 Jun 2023 13:53:24 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Petr Oros <poros@redhat.com>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mschmidt@redhat.com,
        linux-clk@vger.kernel.org, vadim.fedorenko@linux.dev
Subject: Re: [RFC PATCH v8 04/10] dpll: netlink: Add DPLL framework base
 functions
Message-ID: <ZJLktA6RJaVo3BdH@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-5-arkadiusz.kubalewski@intel.com>
 <c7480d0a71fb8d62108624878f549c0d91d4c9e6.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7480d0a71fb8d62108624878f549c0d91d4c9e6.camel@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jun 21, 2023 at 01:18:59PM CEST, poros@redhat.com wrote:
>Arkadiusz Kubalewski píše v Pá 09. 06. 2023 v 14:18 +0200:
>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>

[...]

Could you perhaps cut out the text you don't comment? Saves some time
finding your reply.


>> +static int
>> +dpll_set_from_nlattr(struct dpll_device *dpll, struct genl_info
>> *info)
>> +{
>> +       const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>> +       struct nlattr *tb[DPLL_A_MAX + 1];
>> +       int ret = 0;
>> +
>> +       nla_parse(tb, DPLL_A_MAX, genlmsg_data(info->genlhdr),
>> +                 genlmsg_len(info->genlhdr), NULL, info->extack);
>> +       if (tb[DPLL_A_MODE]) {
>Hi,
>
>Here should be something like:
>               if (!ops->mode_set)
>                       return -EOPNOTSUPP;

Why? All drivers implement that.
I believe that it's actullaly better that way. For a called setting up
the same mode it is the dpll in, there should be 0 return by the driver.
Note that driver holds this value. I'd like to keep this code as it is.

[...]
