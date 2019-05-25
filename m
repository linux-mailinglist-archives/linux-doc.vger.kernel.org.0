Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03E42A52A
	for <lists+linux-doc@lfdr.de>; Sat, 25 May 2019 17:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfEYPuo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 25 May 2019 11:50:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56944 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726971AbfEYPun (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 May 2019 11:50:43 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4PFgPH8074634
        for <linux-doc@vger.kernel.org>; Sat, 25 May 2019 11:50:42 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2spxmrxqda-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 25 May 2019 11:50:42 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 25 May 2019 16:50:41 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 25 May 2019 16:50:35 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4PFoYP633227200
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 25 May 2019 15:50:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6EC8CB206A;
        Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4D0D0B205F;
        Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.80.199.73])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat, 25 May 2019 15:50:34 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 1DB1C16C32DC; Sat, 25 May 2019 08:50:35 -0700 (PDT)
Date:   Sat, 25 May 2019 08:50:35 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Reply-To: paulmck@linux.ibm.com
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
 <20190525141954.GA176647@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525141954.GA176647@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19052515-0060-0000-0000-00000347D01F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011161; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01208442; UDB=6.00634729; IPR=6.00989440;
 MB=3.00027049; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-25 15:50:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052515-0061-0000-0000-0000497ECEE0
Message-Id: <20190525155035.GE28207@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-25_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905250110
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 25, 2019 at 10:19:54AM -0400, Joel Fernandes wrote:
> On Sat, May 25, 2019 at 07:08:26AM -0400, Steven Rostedt wrote:
> > On Sat, 25 May 2019 04:14:44 -0400
> > Joel Fernandes <joel@joelfernandes.org> wrote:
> > 
> > > > I guess the difference between the _raw_notrace and just _raw variants
> > > > is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> > > > that check?  
> > > 
> > > This is true.
> > > 
> > > Since the users of _raw_notrace are very few, is it worth keeping this API
> > > just for sparse checking? The API naming is also confusing. I was expecting
> > > _raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
> > > want to nuke _raw_notrace as done in this series and later we can introduce a
> > > sparse checking version of _raw if need-be. The other option could be to
> > > always do sparse checking for _raw however that used to be the case and got
> > > changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html
> > 
> > What if we just rename _raw to _raw_nocheck, and _raw_notrace to _raw ?
> 
> That would also mean changing 160 usages of _raw to _raw_nocheck in the
> kernel :-/.
> 
> The tracing usage of _raw_notrace is only like 2 or 3 users. Can we just call
> rcu_check_sparse directly in the calling code for those and eliminate the APIs?
> 
> I wonder what Paul thinks about the matter as well.

My thought is that it is likely that a goodly number of the current uses
of _raw should really be some form of _check, with lockdep expressions
spelled out.  Not that working out what exactly those lockdep expressions
should be is necessarily a trivial undertaking.  ;-)

That aside, if we are going to change the name of an API that is
used 160 places throughout the tree, we would need to have a pretty
good justification.  Without such a justification, it will just look
like pointless churn to the various developers and maintainers on the
receiving end of the patches.

							Thanx, Paul

> thanks, Steven!
> 

