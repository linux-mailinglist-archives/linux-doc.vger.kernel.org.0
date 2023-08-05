Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEB8770E28
	for <lists+linux-doc@lfdr.de>; Sat,  5 Aug 2023 08:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjHEGnz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 5 Aug 2023 02:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjHEGnw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Aug 2023 02:43:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FF71BE
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 23:43:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9936b3d0286so407435266b.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691217830; x=1691822630;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=fI0IdoXOvcDFp/TFe6tNB54+yAWSvxH8Zh+XLrDZpTuld3fJbS+DuZSFLqW9YgqseX
         4akrMUkIlH8A0RNQ6uZlBhD2vSl/tI88Emx+HHrckk6iT4w9aEIRRx+1k6VfpsVQDKET
         TY22K+Oh1gjSIPZJLmNpRq1eDvzRJ4UevCHDGQX0lehvFOsopQgcVZQ+2WZIbRPkfP53
         4qU8wFITjBLvOLBE7aLOQSW/jJAUxTtZKtAszb8gjPMsXb0fS9ZtB5x9eatYR8U5kLFU
         lWiQGpOnzqf4wyGILyBl9gEPbX9iLal1b1N5lJPHKxYkC8AjSMUaS8OwwptUs5POiCPI
         EyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691217830; x=1691822630;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=AOi6keCzIUx4BDPpP9Vu7udauv955nPmkhLsW199qgcj57iAAkevig/4kEdiOWj96p
         cgGqwdT8WjXNObE2AhEwtvBYRyV+Zes0JXFRd5Yo9udOMNKc+KgU6KEXByGchGNxJiB5
         JtSVcfr7Mvm3g3B5ky57yiMdOxocEWVSWA5Y3rRItlRwKYOQhjcBqIDcTu1ZgEwxf6md
         78qEh55K4Y/rHDs4PWsB7LJ/JDlMQn3PYjVd6ezpKFIIfVI7c8+hFUTg5KRP5/MFlouX
         2V6lKqU3ylD7a9flaXL2ko2l5sVAEOymNboNK56EVA78oVs9HwP43bqe9fV48s1pDo8v
         ccmA==
X-Gm-Message-State: AOJu0YwJswnc8IiqQFduv4lS1InEWPitxcmpD64TDUmfMkXhpCWPBq7O
        HwRY7hbdbmeQqVZQw2kw9tSKtKgiqGuQhgFyB30=
X-Google-Smtp-Source: AGHT+IEl1NuIN82xxyrBQD+s/Zn0M7QFkGsXZ4ZFmr6qZ9EP5GvkrTWFyE2VXvpsTcPx0h/SafTKp5lqA2W+yRb//ws=
X-Received: by 2002:a17:906:1c7:b0:99b:22dd:f83d with SMTP id
 7-20020a17090601c700b0099b22ddf83dmr3797948ejj.55.1691217829572; Fri, 04 Aug
 2023 23:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:6629:b0:df:940:19b1 with HTTP; Fri, 4 Aug 2023
 23:43:49 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   Bintu Felicia <bimmtu@gmail.com>
Date:   Sat, 5 Aug 2023 07:43:49 +0100
Message-ID: <CAAF5Ruxz2Ewx0JS8DadqixYJ1dMiUNHqMW7dT=ZCAgF3-FRb0w@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
