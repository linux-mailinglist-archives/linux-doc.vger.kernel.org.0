Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C758878B840
	for <lists+linux-doc@lfdr.de>; Mon, 28 Aug 2023 21:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjH1T0x (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Aug 2023 15:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjH1T02 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 15:26:28 -0400
X-Greylist: delayed 911 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Aug 2023 12:26:23 PDT
Received: from symantec.comsats.net.pk (symantec.comsats.net.pk [210.56.11.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D384011A
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 12:26:23 -0700 (PDT)
X-AuditID: d2380b23-3d9ff70000007104-e9-64ecf14df146
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 14.E7.28932.D41FCE46; Tue, 29 Aug 2023 00:11:09 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=BZ9O12GvDL7N8DR5x9gz1kYf0OvWtzpn3+i9fzOIslTD09BQ1D3zkLDsh3AR3GDcq
          LhYAyd8BDoqlEyuC+ZQCnSpANovhKM3QOjWLgBrWFI2aLNs7jVsiZCTVRAX2BlYxb
          1N9k2ZYpM3BnlJzjoOpIUNmQqFpkjtGtlani3YMqw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=olmk80cLmZoXHNEULi94oyNYNSuJDPnVFjLFsR7WPgY=;
        b=fX8NmiyXFsIYJZqQRqOrXUlK4u+cH6WoRBrDrPlJdMTTxxd4T39CAc6bGE1TxD26b
          d0VfpufbuD6SSw8hr9ShE0kyssuW7ihlJjUBSIcZK/eUos0tuG2Kh5SvxrcaLvQTU
          TxUSXfyXQ/yyKLt0Sr8tcmW6snKqMGUTgzifB83SA=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Mon, 28 Aug 2023 23:58:45 +0500
Message-ID: <14.E7.28932.D41FCE46@symantec.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Thanks for your response!
To:     linux-doc@vger.kernel.org
From:   "Hou Qijun" <conference@iesco.com.pk>
Date:   Mon, 28 Aug 2023 11:59:05 -0700
Reply-To: qijunhou02@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xbVRTHc/teyxvluccrP84Kw6Rm+4M5FJ2GbEbZdKERDZpomDPKHvRB
        CaVt+h44TGY6ZgxWh1NhK92G7SQLE+ImmKojnbVCdaQaqasz+4GO0CWUSacbkbIg3tcftP/c
        nPc593zP995zH0WwQUpNNRtF3mLkDBpFNhmsKFZuff7vW7qHT7u3VrjeGSArkfbOSMkLaG/2
        Ezre0NzOWx56cl+2fso2m2UeI/Y7+gazrGhWZkPrKGC2QfgTr0KKWWZMBmfCZikmmSEClq9X
        2VA2jm8QsLTcJZM+WOYQAutQCEm7aGY7HAz1xWOCKYPfe3sUCZ4LF/tmyQTfAqdd84QNUTje
        DIs2UcIqRgMrEyvx7XnMRoh9MUVIsQJvH3XeJhMmNsF7zhtyqZRlSuAHd/sRtN6R0cyR0cyR
        0cyRbuZE5GeoUOho5fCdNZQ1mFoFThTKjLxYZm4ZQfELVD7wNfr0SJ0PMRTS5NBd1ls6Vs61
        4yIfqqZkmnz66kGM7qs36Tr0nKCvs7QZeEGTR2+PYEyv4fo2Q4tGTRdfxlS1Ro38G4KBF/HE
        fAgoApcFd0ZwmY7reJO3mBJiPlREkZpCunjzzQaWaeJEvoXnzbwllX2JojRAn5nDyrkWvonf
        39hsEFNpXOetntexTGYmbmYj/Uou7lWQmcj0I6PW+ZCWysGmasLSWQQz1yo0NyV1VQmak6Jx
        zQ300K8YsimY1ptEJqq/+1sPQXUtBPC66LZ5CZY0moy8upB+ewFXMVKVvs245l1dQPsnsMX1
        GQmpjbqYviDx/Aye7pR6+BG0hPDMVHR+VPKJ/4u0eZb+6QqGyiSMewf68XnpCpMsLfjIOazD
        DMtg2l8LPzodchj3XVXAkneVgtHOezkwfPafAlhw2gGGh+cAQt8EyuFS+Po2mHXFdsCJ776v
        glVr8FlY7Lr5HIzc66mB7sDEyzDYOdcIkfm7Zpj2Hm4H+1LPAbDfduOf6MOj0XcR9J70v4/g
        j8AvhxFcito/QPDXZO9HCO6sXjiG4N/f/HidcdmPIzgV85xEEAxN9+P1/OgAiuDByfDger6S
        XpMgcmLm4JSeiDS4JE0OTi5BNgXTp1dbUcnTP8usz4S15sbqU6VbsibeEjtLYM+jI+4vK3ff
        3zKmlZHdMZdYe7Z0KBTN857YUD8g/7j7seN71desRR4/uevPQ68WxXZNnq+0OwanDngWZUd3
        vEY9eNdcPh7d11++UqfcWavaozV/zl++EqiYGa+tebHqqf/y0e5r6PWL52Y2LWtIQc+VlxIW
        gfsf+U+zZ+UEAAA=
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [210.56.11.35 listed in list.dnswl.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [qijunhou02[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for your response,


Kindly reconfirm your interest to further discuss the investment Thanks for=
 your response,


partnership within your country as I explained earlier so we can have a fur=
ther discussion to facilitate the process for mutual interest.

Looking forward to your response.

Hou Qijun
Vice President- CNPC
China National Petroleum Corporation
No. 9 Dongzhimen North Street Dongcheng District Beijing.

