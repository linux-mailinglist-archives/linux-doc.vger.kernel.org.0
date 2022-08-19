Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A0159A86F
	for <lists+linux-doc@lfdr.de>; Sat, 20 Aug 2022 00:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiHSWSR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Aug 2022 18:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbiHSWSP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 18:18:15 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76DCC52
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 15:18:11 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id 2so5239758pll.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=r+cCMT58pYHKtEwlcJSRL8VNEfa9oIZs3vISfoDn2kc=;
        b=BcAPABzciTIGP2cxF54N2Wsd/iSJnRwhaMTJUEPlID3X+lEPUS9PKxCYhEulFZwRxd
         06bqrTdWnqjtnqc2C3v4TI8GRA6eiJXScnwQfLinTWZ/GYZMRuQkN3HbWHc1PSDNRaEY
         Xl4RNP3A6PtVIwmuNLThV2GWpVrvVfgQSzyN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=r+cCMT58pYHKtEwlcJSRL8VNEfa9oIZs3vISfoDn2kc=;
        b=uyXMvDV+3aYpj09/FGTVKlSjRo8wjaMI7ENP3hTeE+6iNPVBNGPuz6iExgZLxaRTqD
         E5iiAbD1dLT9I1YldGJ4M2bLDJ4oknWxrBsnKufBTDTp/xwXEKIvQ9anZcSZj7Wt91C2
         lXoywvTKMqkElKwywelLWidQLQMR9Dj470N54Fb1Me9vaQN4Z83q+Fhv6nEJREDsJMx3
         Sbckx2djASRGwWbkZgUaUom7vF/3iv/xClZYfMGX584kgsrVr0CC3dDqyvAGpaPbueTk
         ImLt6dY4qNXyUJpHHuS0rQW1VHHwYJn4qAm/fOJoJqD9LhOh3CN18TRXd1B5L6vIA+ng
         LPsQ==
X-Gm-Message-State: ACgBeo2DWxRoPIAO9xz26zsLpca5gBouhs0wPpthLGdmITRWu+o7UKJz
        SDrW8Q8f8P83WPDJfAAsNB4k8Q==
X-Google-Smtp-Source: AA6agR5RK5bWwK14DmSWfIsVl2lWE7zgftE7SAP1zrNok3zDiq4QmjJez0ZgiEkrRJEXvaPKAwRg5Q==
X-Received: by 2002:a17:90a:8911:b0:1fa:c8f7:1450 with SMTP id u17-20020a17090a891100b001fac8f71450mr10531200pjn.123.1660947491479;
        Fri, 19 Aug 2022 15:18:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090a4a0500b001f303d149casm3603350pjh.50.2022.08.19.15.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 15:18:10 -0700 (PDT)
Date:   Fri, 19 Aug 2022 15:18:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     Sadiya Kazi <sadiyakazi@google.com>, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, davidgow@google.com,
        corbet@lwn.net, brendan.higgins@linux.dev,
        Trevor Woerner <twoerner@gmail.com>, siqueirajordao@riseup.net,
        mwen@igalia.com, andrealmeid@riseup.net, mairacanal@riseup.net,
        Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 7/8] lib: overflow: update reference to kunit-tool
Message-ID: <202208191518.980071F7@keescook>
References: <20220819053234.241501-1-tales.aparecida@gmail.com>
 <20220819053234.241501-8-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819053234.241501-8-tales.aparecida@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 19, 2022 at 02:32:33AM -0300, Tales Aparecida wrote:
> Replace URL with an updated path to the full Documentation page
> 
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
