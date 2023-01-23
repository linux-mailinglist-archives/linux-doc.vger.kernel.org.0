Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D395677FFF
	for <lists+linux-doc@lfdr.de>; Mon, 23 Jan 2023 16:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjAWPiM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Jan 2023 10:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjAWPiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jan 2023 10:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B379B29408
        for <linux-doc@vger.kernel.org>; Mon, 23 Jan 2023 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674488233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nrgSGGG2jivQORYVrLOlwmevh4Rgh/EU/neEY/ItRis=;
        b=F+BcMF2m66Kp0JWp4DfK8QCkH9doBVQVZvzozErqAoKUWxXTlECLUNIEFtIYYESQ0Jjo8G
        fTsftDJEaEDLvEX7itfZ45rwiseBhfngIJ76SEUaEW39Ild0cNh69xg1j3ka10u/No6DXl
        jIsC/6oFjB/GScSNQ7ljwjoXpWpQQHw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-LdT2HzVcOXKKckaZWgrTSA-1; Mon, 23 Jan 2023 10:37:12 -0500
X-MC-Unique: LdT2HzVcOXKKckaZWgrTSA-1
Received: by mail-ed1-f69.google.com with SMTP id m7-20020a056402510700b00488d1fcdaebso8644967edd.9
        for <linux-doc@vger.kernel.org>; Mon, 23 Jan 2023 07:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrgSGGG2jivQORYVrLOlwmevh4Rgh/EU/neEY/ItRis=;
        b=wRU9PukIpwgouMMgPFQe4hNiJXZ5CveXntxB4VtvfNWFInkVP3/a41+tBILdV2F4Pr
         VQrIHX1Bbh4J9rhnuk1HqMEaweO7T4NEjLeYsMjrD0reoliEPp+2Zd2tsgOlqkb4rUSP
         YuSgUO+AeUtO4SUhUl1rPO6ARYaHwj0kG9jsdIo4WRGRd+jZHRMVdcN6UJPB85Ce7PeL
         b7+sLmQf6ZSSqmJozJK2X/xVzLqnGrmJO1ltSkAYcjDBO9DflTHKfVOStmN9jXq4H7Hc
         etZtBZ2fQChHOSFeiukTPcGrEXHCxL6qZpenLrfIvh3Zpz4ixMvcA+TW7VNiXGbZpfiC
         aZlg==
X-Gm-Message-State: AFqh2kojKVMQMwdxFAdyLYPV0P5dAIntIjJP9jKF4yWFKsDZgmJyO9x/
        X2adhRvYN2XDOBO+jEjAkNVScbc3JF5kZAMVzaHJRoMC4iKjRJnC+Ek6E14oGMq9NZMCHUYy4vn
        16hUVQx5g96x0Qr06mrHa
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr11987747ejc.10.1674488231733;
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtr1c6/aX5wLHbH7NQWaOi30A9xv9EkJz28AZBsNN6soWEYPWWpSZA9Zkp3Fm+NFpmtrXZwug==
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr11987725ejc.10.1674488231560;
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kz22-20020a17090777d600b007c1633cea13sm22618884ejc.12.2023.01.23.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
Message-ID: <33c497ad-2279-ccf6-016b-52b8e1b4783f@redhat.com>
Date:   Mon, 23 Jan 2023 16:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202223327.690880-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 12/2/22 23:33, Maximilian Luz wrote:
> We have some new insights into the Serial Hub protocol, obtained through
> reverse engineering. In particular, regarding the command structure. The
> input/output target IDs actually represent source and target IDs of
> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> debug connector, and SurfLink connector).
> 
> This series aims to improve handling of messages with regards to those
> new findings and, mainly, improve clarity of the documentation and usage
> around those fields.
> 
> See the discussion in
> 
>     https://github.com/linux-surface/surface-aggregator-module/issues/64
> 
> for more details.
> 
> There are a couple of standouts:
> 
> - Patch 1 ensures that we only handle commands actually intended for us.
>   It's possible that we receive messages not intended for us when we
>   enable debugging. I've kept it intentionally minimal to simplify
>   backporting. The rest of the series patch 9 focuses more on clarity
>   and documentation, which is probably too much to backport.
> 
> - Patch 8 touches on multiple subsystems. The intention is to enforce
>   proper usage and documentation of target IDs in the SSAM_SDEV() /
>   SSAM_VDEV() macros. As it directly touches those macros I
>   unfortunately can't split it up by subsystem.
> 
> - Patch 9 is a loosely connected cleanup for consistency.
> 
> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> aggregator: Enforce use of target-ID enum in device ID macros") touches
> multiple subsystems, it should be possible to take the whole series
> through the pdx86 tree. The changes in other subsystems are fairly
> limited.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> 
> Maximilian Luz (9):
>   platform/surface: aggregator: Ignore command messages not intended for
>     us
>   platform/surface: aggregator: Improve documentation and handling of
>     message target and source IDs
>   platform/surface: aggregator: Add target and source IDs to command
>     trace events
>   platform/surface: aggregator_hub: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: aggregator_tabletsw: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: dtx: Use target-ID enum instead of hard-coding
>     values
>   HID: surface-hid: Use target-ID enum instead of hard-coding values
>   platform/surface: aggregator: Enforce use of target-ID enum in device
>     ID macros
>   platform/surface: aggregator_registry: Fix target-ID of base-hub
> 
>  .../driver-api/surface_aggregator/client.rst  |  4 +-
>  .../driver-api/surface_aggregator/ssh.rst     | 36 ++++-----
>  drivers/hid/surface-hid/surface_hid.c         |  2 +-
>  drivers/hid/surface-hid/surface_kbd.c         |  2 +-
>  .../platform/surface/aggregator/controller.c  | 12 +--
>  .../platform/surface/aggregator/ssh_msgb.h    |  4 +-
>  .../surface/aggregator/ssh_request_layer.c    | 15 ++++
>  drivers/platform/surface/aggregator/trace.h   | 73 +++++++++++++++++--
>  .../platform/surface/surface_aggregator_hub.c |  8 +-
>  .../surface/surface_aggregator_registry.c     |  2 +-
>  .../surface/surface_aggregator_tabletsw.c     | 10 +--
>  drivers/platform/surface/surface_dtx.c        | 20 ++---
>  .../surface/surface_platform_profile.c        |  2 +-
>  drivers/power/supply/surface_battery.c        |  4 +-
>  drivers/power/supply/surface_charger.c        |  2 +-
>  include/linux/surface_aggregator/controller.h |  4 +-
>  include/linux/surface_aggregator/device.h     | 50 ++++++-------
>  include/linux/surface_aggregator/serial_hub.h | 40 ++++++----
>  18 files changed, 191 insertions(+), 99 deletions(-)
> 

