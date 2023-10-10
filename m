Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EE27BF819
	for <lists+linux-doc@lfdr.de>; Tue, 10 Oct 2023 11:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjJJJ7x (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Oct 2023 05:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjJJJ7v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 05:59:51 -0400
Received: from out-197.mta1.migadu.com (out-197.mta1.migadu.com [IPv6:2001:41d0:203:375::c5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01741C4
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 02:59:47 -0700 (PDT)
Message-ID: <8b727f96-1dfd-4a93-9d10-e9bd3f8eebc9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1696931983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OLTR3Fa5NU1FJ0mPUCV17BXWlC/RQ59d9nTce1fx2KM=;
        b=JMLc+Q+7l0vIDURftnwdjjdsJLixj3ifTOXqqF00ihEFQkN0d6E00eGp0nphAWelDmVVhN
        ZCkVlzM6xSa+le8V49PWChfPucXF2y+2ml/qxrTT93Zz0K8Dcb4aUf9F/l3Bu91JynHHnJ
        u2+5xXzRnNABRz9ez3owztBf3lljSeA=
Date:   Tue, 10 Oct 2023 10:59:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/5] dpll: add phase-offset and phase-adjust
Content-Language: en-US
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org
Cc:     jiri@resnulli.us, corbet@lwn.net, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
References: <20231009222616.12163-1-arkadiusz.kubalewski@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20231009222616.12163-1-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/10/2023 23:26, Arkadiusz Kubalewski wrote:
> Improve monitoring and control over dpll devices.
> Allow user to receive measurement of phase difference between signals
> on pin and dpll (phase-offset).
> Allow user to receive and control adjustable value of pin's signal
> phase (phase-adjust).
> 
> v3->v4:
> - do not increase do version of uAPI header as it is not needed (v3 did
>    not have this change)
> - fix spelling around commit messages, argument descriptions and docs
> - add missing extack errors on failure set callbacks for pin phase
>    adjust and frequency
> - remove ice check if value is already set, now redundant as checked in
>    the dpll subsystem
> 
> v2->v3:
> - do not increase do version of uAPI header as it is not needed
> 
> v1->v2:
> - improve handling for error case of requesting the phase adjust set
> - align handling for error case of frequency set request with the
> approach introduced for phase adjust
> 
> 
> Arkadiusz Kubalewski (5):
>    dpll: docs: add support for pin signal phase offset/adjust
>    dpll: spec: add support for pin-dpll signal phase offset/adjust
>    dpll: netlink/core: add support for pin-dpll signal phase
>      offset/adjust
>    ice: dpll: implement phase related callbacks
>    dpll: netlink/core: change pin frequency set behavior
> 
>   Documentation/driver-api/dpll.rst         |  53 +++++-
>   Documentation/netlink/specs/dpll.yaml     |  31 +++
>   drivers/dpll/dpll_netlink.c               | 188 +++++++++++++++++-
>   drivers/dpll/dpll_nl.c                    |   8 +-
>   drivers/dpll/dpll_nl.h                    |   2 +-
>   drivers/net/ethernet/intel/ice/ice_dpll.c | 220 +++++++++++++++++++++-
>   drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
>   include/linux/dpll.h                      |  18 ++
>   include/uapi/linux/dpll.h                 |   6 +
>   9 files changed, 518 insertions(+), 18 deletions(-)
> 

Acked-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

