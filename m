Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7971872AD49
	for <lists+linux-doc@lfdr.de>; Sat, 10 Jun 2023 18:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjFJQ2w (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 10 Jun 2023 12:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjFJQ2v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Jun 2023 12:28:51 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EAD3596
        for <linux-doc@vger.kernel.org>; Sat, 10 Jun 2023 09:28:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso4848873a12.3
        for <linux-doc@vger.kernel.org>; Sat, 10 Jun 2023 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1686414528; x=1689006528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=30WOLsGQCYvxDVRWI/IBP3AT/golpqjgGSCaFINHdfo=;
        b=guia8WUFmfAeCNlbh5rPHTD2q3nJKVeKcvJMUly1nhsb9uaYE2E4cKXnC0m4+bWjAA
         2YOLywPxfAUw7h8ao5xVZRpev5PZRAee+L2+7zkCqrmwVGOzppw2OUl/hu6CrqWA3vzQ
         VBLrYGQie4fpsenx1m3AcVS2na89o0vuu480gAcZKmof7dw/X178PywDejxDqrIWkxBY
         87ycKrSlj5IDAROexkK6ol52X27DLrFjGHOYqD+BDuQPH9HDpEljVpnsOJWKMMJqDMV+
         ise+X0heN9K374K6+gMzmESCjlS01pg9sOpuYos016GSQGQs/E5bgVoaELFJqVPBq1L6
         elqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686414528; x=1689006528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30WOLsGQCYvxDVRWI/IBP3AT/golpqjgGSCaFINHdfo=;
        b=GSAoWbXE0c7DnFCZ1yHQfio+ldpUEX36gyaYwWQMIHXbgiaN5mih0hzEs3XS/qevRF
         KkaFyxBy0pFQjAmY1mqqz0+EKpMnpiWH0sYml2Ismm9DEw7xlpnKewLS37qNeuxsG84w
         oM77TWS+g9p8Dijqro6C+8ou9XtuO/h7AvK015rO4iE3zXUYkIb+fYK3gvH15+yokgVo
         vv+fbKJo/pZXa9Brry13I5dx2qKzVLo/9v0dZIWqY72rlEikjw+qgjTxVMpBvBjv1VrP
         5GsF1kwMfAIVVqIhT2qrWoRNBU516Ig+FSiWil3DhB+OSAVeW3tG6NzsqlZYe5619ZA9
         SCOw==
X-Gm-Message-State: AC+VfDz4RDYaQE3LZU0fWvTTXUXnfesdMpoJBo+o/gzW+wnOj+z02wJL
        fC2uuoiKAkUeZKkaX7yi3ObIqQ==
X-Google-Smtp-Source: ACHHUZ5KAnAn+uVG/YplGa6zQ40p3y3TLHFiee/1HtvuRh+HE/5jDxye7qmmH//ArHvb+lfWrfUfuw==
X-Received: by 2002:aa7:cf99:0:b0:511:111f:c8bf with SMTP id z25-20020aa7cf99000000b00511111fc8bfmr1792605edx.9.1686414527666;
        Sat, 10 Jun 2023 09:28:47 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7dbda000000b0050cc4461fc5sm2962933edt.92.2023.06.10.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 09:28:46 -0700 (PDT)
Date:   Sat, 10 Jun 2023 18:28:45 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
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
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Subject: Re: [RFC PATCH v8 01/10] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZISkvTWw5k74RO5s@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-2-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-2-arkadiusz.kubalewski@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Jun 09, 2023 at 02:18:44PM CEST, arkadiusz.kubalewski@intel.com wrote:
>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>
>Add documentation explaining common netlink interface to configure DPLL
>devices and monitoring events. Common way to implement DPLL device in
>a driver is also covered.
>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---
> Documentation/driver-api/dpll.rst  | 458 +++++++++++++++++++++++++++++
> Documentation/driver-api/index.rst |   1 +
> 2 files changed, 459 insertions(+)
> create mode 100644 Documentation/driver-api/dpll.rst

Looks fine to me. I just wonder if the info redundancy of this file and
the netlink yaml could be somehow reduce. IDK.
