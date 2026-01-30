from django.core.management.base import BaseCommand
from page_builder.models import ContentBlock, Component, SubComponent, Page, Profile
from bs4 import BeautifulSoup
from django.db import transaction
import json

class Command(BaseCommand):
    data = """<ul>

            <li>
                A. Kumar and A. Singh, "Smart Precision Farming: A Water Efficient
                Irrigation System,"
                <b>2025 International Conference on Electronics, AI and Computing
                    (EAIC)</b>,
                Jalandhar, India, 2025, pp. 1-6, doi: 10.1109/EAIC66483.2025.11101486.
            </li><br>

            <li>
                Tyagi, D., Singh, A., Cherifi, H. (2025).
                MAVS: An Ensemble-Based Multi-agent Framework for Fake News Detection.
                In: Paszynski, M., Barnard, A.S., Zhang, Y.J. (eds)
                <b>Computational Science – ICCS 2025 Workshops</b>.
                ICCS 2025. Lecture Notes in Computer Science, vol 15908.
                Springer, Cham.
            </li><br>

            <li>
                N. Sinha and A. Singh,
                "Opinion Dynamics &amp; Synchronization in Higher-Order Networks: Using
                the Kuramoto Model and Simplicial
                Complexes,"
                <b>2024 International Conference on Artificial Intelligence and Emerging
                    Technology (Global AI Summit)</b>,
                Greater Noida, India, 2024, pp. 630-635 (Best Paper Award).
            </li><br>

            <li>
                B. Chakraborty and A. Singh,
                "An End-to-End Vision-Based Approach for Indian Sign Language
                Recognition and Captioning,"
                <b>2025 IEEE International Conference on Computer, Electronics,
                    Electrical Engineering &amp; their Applications
                    (IC2E3)</b>,
                Srinagar Garhwal, India, 2025, pp. 1-6, doi:
                10.1109/IC2E365635.2025.11167226.
            </li><br>

            <li>
                A. Kumar and A. Singh,
                "Smart Precision Farming: A Water Efficient Irrigation System,"
                <b>2025 International Conference on Electronics, AI and Computing
                    (EAIC)</b>,
                Jalandhar, India, 2025, pp. 1-6, doi: 10.1109/EAIC66483.2025.11101486.
            </li><br>

            <li>
                Tyagi, D., Singh, A., Cherifi, H. (2025).
                MAVS: An Ensemble-Based Multi-agent Framework for Fake News Detection.
                In: Paszynski, M., Barnard, A.S., Zhang, Y.J. (eds)
                <b>Computational Science – ICCS 2025 Workshops</b>.
                ICCS 2025. Lecture Notes in Computer Science, vol 15908.
                Springer, Cham. https://doi.org/10.1007/978-3-031-97557-8_20.
            </li><br>

            <li>
                V. Sharma, B. Chakraborty, A. Singh and A.S. Chauhan,
                "Integrating Skeleton Graphs with Transformers for Gloss-Free Indian
                Sign Language Captioning",
                <b>14th International Conference on Computational Data and Social
                    Networks</b>,
                2025, Springer, Danang, Vietnam (Accepted for presentation and
                publication).
            </li><br>

            <li>
                A. K. Singhal and A. Singh,
                "Integrating Network-Derived Metrics: A Feature Augmentation Framework
                for Improved Prediction,"
                <b>14th International Conference on Computational Data and Social
                    Networks</b>,
                2025, Springer, Danang, Vietnam (Accepted for presentation and
                publication).
            </li><br>

            <li>V Sharma, A. Singh, S Gaito (2025). "Indian Sign Language recognition
                and translation: An Encoder-Decoder Approach". <b>2025 17th
                    International Conference on COMmunication Systems and NETworks
                    (COMSNETS).</b></li><br>
            <li>A Jha, A Singh, H Cherifi (2024). "Synchronisation in Higher Order
                Network of Simplicial Complexes". <b>International Conference on Complex
                    Networks and Their Applications.</b></li><br>

            <li>V. Sharma, A. Singh and S. Gaito, "Object Centered Video Captioning
                using Spatio-temporal Graphs,"<b> 2024 IEEE International Conference on
                    Interdisciplinary Approaches in Technology and Management for Social
                    Innovation (IATMSI)</b>, Gwalior, India, 2024.</li><BR>
            <li>A. Singh, P. Singh, V. Sharma, D. Tyagi, N. Pandey and B. Vaid,
                "Palanam: A Deep Learning Based Childhood Defense System,"<b> 2024 16th
                    International Conference on COMmunication Systems & NETworkS
                    (COMSNETS)</b>, Bengaluru, India, 2024, pp. 273-275</li><BR>
            <li>V. Sharma, A. Singh and S. Gaito, "Video Captioning using
                Spatio-temporal Graphs: An Encoder-Decoder Approach," <b>2024 16th
                    International Conference on COMmunication Systems & NETworkS
                    (COMSNETS)</b>, Bengaluru, India, 2024, pp. 424-426.</li><BR>
            <li>A. K. Singhal, S. Manhas and A. Singh, "Health Prediction Using Network
                Reconstruction Based Model," <b>2024 16th International Conference on
                    COMmunication Systems & NETworkS (COMSNETS)</b>, Bengaluru, India,
                2024, pp. 409-411.</li><BR>
            <li>B. Sajja and A. Singh, "Detection of Violent Content in Videos Using 2D
                Attention-Augmented Convolutional Networks and Gated Recurrent Unit,"
                <b>2023 IEEE 20th India Council International Conference (INDICON)</b>,
                Hyderabad, India, 2023, pp. 967-972.
            </li><BR>
            <li><a href="https://ieeexplore.ieee.org/document/10177015"> Bharadwaj, R.
                    Gupta, R. Gurjar and A. Singh, "Importance of CURE Clustering
                    Algorithm over K-Means Clustering Algorithm for Large Data-set,"
                    <b>2023 Third International Conference on Secure Cyber Computing and
                        Communication (ICSCCC)</b>, Jalandhar, India, 2023, pp.
                    421-426.</a></li><BR>
            <li><a
                    href="https://link.springer.com/chapter/10.1007/978-3-031-26303-3_20">Vashishtha,
                    R., Singh, A., Cherifi, H. (2023). A Community Detection Algorithm
                    Using Random Walk. In: Dinh, T.N., Li, M. (eds) <b>Computational
                        Data and Social Networks. CSoNet 2022</b>. Lecture Notes in
                    Computer Science, vol 13831. Springer, Cham.</a></li><BR>
            <li><a
                    href="https://link.springer.com/chapter/10.1007/978-3-031-21131-7_10">Vashishtha,
                    R., Singh, A., Cherifi, H. (2023). A Biased Random Walk Scale-Free
                    Network Growth Model with Tunable Clustering. In: Cherifi, H.,
                    Mantegna, R.N., Rocha, L.M., Cherifi, C., Micciche, S. (eds)
                    <b>Complex Networks and Their Applications XI. COMPLEX NETWORKS 2016
                        2022</b>. Studies in Computational Intelligence, vol 1078.
                    Springer, Cham.</a></li><BR>
            <li><a
                    href="https://link.springer.com/chapter/10.1007/978-3-031-21131-7_28">Kumar,
                    P., Singh, A., Sharma, A.K., Cherifi, H. (2023). Mean Hitting Time
                    of Q-subdivision Complex Networks. In: Cherifi, H., Mantegna, R.N.,
                    Rocha, L.M., Cherifi, C., Micciche, S. (eds) <b>Complex Networks and
                        Their Applications XI. COMPLEX NETWORKS 2016 2022</b>. Studies
                    in Computational Intelligence, vol 1078. Springer, Cham.</a></li>
            <BR>
            <li><a href="https://ieeexplore.ieee.org/document/9785059">A. Singh and B.
                    Sachan, "Quantum Walk Circuits to Analyze Networks," <b>2022 8th
                        International Conference on Advanced Computing and Communication
                        Systems (ICACCS)</b>, Coimbatore, India, 2022, pp. 277-284.</a>
            </li><BR>
            <li>Singh, Anurag, and Binshumesh Sachan. "A quantum approach to walk on
                networks." <b>2021 6th International Conference on Signal Processing,
                    Computing and Control (ISPCC). IEEE, 2022</b></li><BR>
            <li>Singh, A., Bhasin, S., Gakhar, B., & Arquam, M. (2022). Modeling the
                Effect of Quarantine and Isolation for COVID-19 Spreading. In
                <b>Artificial Intelligence and Sustainable Computing</b> (pp. 437-450).
                Springer, Singapore.
            </li><BR>
            <li>Singh, Anurag, and Binshumesh Sachan. "Quantum Walk Circuits to Analyze
                Networks." <b>2022 8th International Conference on Advanced Computing
                    and Communication Systems (ICACCS). Vol. 1. IEEE, 2022.</b></li><BR>
            <li>Kumar, Rajesh, and Anurag Singh. "Robustness in Multilayer Networks
                Under Strategical and Random Attacks." <b>Procedia Computer Science 173
                    (2020): 94-103.</b></li><BR>
            <li>Trivedi, Nitesh, and Anurag Singh. "Efficient Influence Maximization in
                Social-Networks Under Independent Cascade Model." <b>Procedia Computer
                    Science 173 (2020): 315-324.</b></li><BR>
            <li>Singh, Nidhi, Anurag Singh, and Rajesh Sharma. "Predicting Information
                Cascade on Twitter Using Random Walk." <b>Procedia Computer Science 173
                    (2020): 201-209.</b></li><BR>
            <li>Eeti, Singh, Anurag. "Effect of Influential Nodes on Time Varying
                Opinion Formation Models." <b>Procedia Computer Science 173 (2020):
                    120-129.</b></li><BR>
            <li>Agrawal, Rimjhim, Md. Arquam, and Anurag Singh. "Community detection in
                Networks using Graph Embedding." <b>Procedia Computer Science 173
                    (2020): 372-381.</b></li><BR>
            <li>Arquam, Md, Anurag Singh, and Hocine Cherifi. "Integrating Environmental
                Temperature Conditions into the SIR Model for Vector-Borne Diseases."
                <b>International Conference on Complex Networks and Their Applications.
                    Springer</b>, Cham, 2019.
            </li><BR>
            <li>Kumar, Prem, Puneet Verma, Anurag Singh, and Hocine Cherifi. "Choosing
                Optimal Seed Nodes in Competitive Contagion." <b>Frontiers in Big Data 2
                    (2019): 16.</b></li><BR>
            <li>Eeti, A. Singh, "Threshold Time Varying Opinion Convergence" in <b>Proc.
                    ICEIT Conference on Advances in Mobile Communications, Networking
                    and Computing</b>, New Delhi, April 11-12, 2019.</li><BR>
            <li>Rajesh Kumar, A. Singh, "Stability of Synchronization Processes in
                Weighted Multiplex Networks" in <b>Proc. ICEIT Conference on Advances in
                    Mobile Communications, Networking and Computing</b>, New Delhi,
                April 11-12, 2019.</li><BR>
            <li>Md. Arquam, A. Singh, "Challenges in Modeling of Communicable and
                Non-Communicable Diseases in Complex Network" in <b>Proc. ICEIT
                    Conference on Advances in Mobile Communications, Networking and
                    Computing</b>, New Delhi, April 11-12, 2019.</li><BR>
            <li>S. Kumari and A. Singh, "Network Capacity Enhancement Over Time-Varying
                Communication Networks: A Survey and Inherent Directives" in <b>Proc.
                    ICEIT Conference on Advances in Mobile Communications, Networking
                    and Computing</b>, New Delhi, April 11-12, 2019.</li><BR>
            <li>Kumar, Rajesh, Anurag Singh, and Hocine Cherifi. "Effect of Topological
                Structure and Coupling Strength in Weighted Multiplex Networks."
                <b>International Conference on Computational Social Networks. Springer,
                    2018.</b>
            </li><BR>
            <li>Arquam, Md, Anurag Singh , and Rajesh Sharma. "Modelling and Analysis of
                Delayed SIR Model on Complex Network." <b>International Workshop on
                    Complex Networks and their Applications. Springer, 2018.</b></li>
            <BR>
            <li>Jain, Eeti, Anurag Singh, and Rajesh Sharma. "TTPROF: A Weighted
                Threshold Model for Studying Opinion Dynamics in Directed Temporal
                Network." <b>International Workshop on Complex Networks and their
                    Applications. Springer, 2018.</b></li><BR>
            <li>Kumar, Prem, Puneet Verma, and Anurag Singh ."A Study of Epidemic
                Spreading and Rumor Spreading over Complex Networks." <b>Towards
                    Extensible and Adaptable Methods in Computing. Springer</b>,
                Singapore, 2018. 131-143.</li><BR>
            <li>Kumari, Prity, and Anurag Singh. "Approximation and Updation of
                Betweenness Centrality in Dynamic Complex Networks." <b>Computational
                    Intelligence: Theories, Applications and Future Directions-Volume I.
                    Springer</b>, Singapore, 2019. 25-37.</li><BR>
            <li>Kumar, M., Singh, A., &Cherifi, H. (2018, April). An Efficient
                Immunization Strategy Using Overlapping Nodes and Its Neighborhoods. In
                <b>Companion of the The Web Conference 2018 on The Web Conference 2018
                    (pp. 1269-1275). International World Wide Web Conferences Steering
                    Committee.</b>
            </li><BR>
            <li>S. Kumari and A. Singh, "Community structured time varying communication
                networks," <b>2018 10th International Conference on Communication
                    Systems & Networks (COMSNETS)</b>, Bengaluru, 2018, pp. 513-515.
            </li><BR>
            <li>Suchi Kumari, Anurag Singh, Hocine Cherifi, "Optimal Local Routing
                Strategies for Community Structured Time Varying Communication
                Networks." (Accepted for
                presentation and publication), <b>CSoNet 2017 (Computational Social
                    Network)</b>, Hong Kong, Aug.3-5, 2017.</li><BR>
            <li>Kumari, Suchi, and Anurag Singh. "Modeling of Data Communication
                Networks using Dynamic Complex Networks and its Performance Studies."
                <b>Complex Networks & Their Applications V: Proceedings of the 5th
                    International Workshop on Complex Networks and their Applications
                    (COMPLEX NETWORKS 2016)</b>. Vol. 693. Springer, 2016.
            </li><BR>
            <li>Chakraborty, D., Singh, A., &Cherifi, H., Immunization Strategies Based
                on the Overlapping Nodes in Networks with Community Structure. In
                <b>International Conference on Computational Social Networks (pp.
                    62-73). Springer International Publishing</b>, August 2016, Ho Chi
                Minh city, Vietnam.
            </li><BR>
            <li>Suchi Kumari, Anurag Singh, and Priya Ranjan. 2016. Towards A Framework
                for Rate Control on Dynamic Communication Networks. In <b>Proceedings of
                    the International Conference on Internet of things and Cloud
                    Computing (ICC '16)</b>, ACM, New York, NY, USA, Article 12, 7
                pages.</li><BR>
            <li>Shikhar Sharma, Anurag Singh, " An Efficient Method for Link Prediction
                in Complex Multiplex Networks, "Signal Image Technology and Internet
                Based Systems (SITIS), <b>2015 Eleventh International Conference</b>,
                November 23-27, 2015, Bangkok, Thailand.</li><BR>
            <li>Naveen Gupta, Anurag Singh, "Predicting The Weights Of Future
                Connections In Social Networks," in <b>Proc. ICEIT Conference on
                    Advances in Mobile Communications, Networking and Computing</b>, New
                Delhi, April 16-17, 2015.</li><BR>
            <li>Naveen Gupta, Anurag Singh, Hocine Cherifi, "Community-based
                immunization strategies for epidemic control," in <b> 2015 7th
                    International Conference on COMmunication Systems & NETworkS
                    (COMSNETS) </b>, vol., no., pp.1-6, 6-10 Jan. 2015.</li><BR>
            <li>Naveen Gupta and Anurag Singh. 2014. A Novel Strategy for Link
                Prediction in Social Networks. In <b>Proceedings of the 2014 CoNEXT on
                    Student Workshop (CoNEXT Student Workshop '14). ACM, New York</b>,
                NY, USA, 12-14.</li><BR>
            <li>Anurag Singh, Yatindra Nath Singh, "Rumor Dynamics and Inoculation of
                Nodes in Weighted Scale Free Networks with Degree - Degree
                Correlation,"Signal Image Technology and Internet Based Systems (SITIS),
                <b>2013 Ninth International Conference</b>, December 2-5, 2013, Kyoto,
                Japan
            </li><BR>
            <li>Amit Munjal, Anurag Singh, Yatindra Nath Singh, "Using Complex Network
                in Wireless Sensor Networks, "<b>Proc. ICEIT Conference on Advances in
                    Mobile Communications, Networking and Computing, New Delhi</b>,
                27-28 Sept 2013.</li><BR>
            <li>Anurag Singh, Rahul Kumar, Y N Singh, "Effects of Inoculation based on
                Structural Centrality on Rumor Dynamics in Social Networks, "Computing
                and Combinatorics (COCOON 2013), Hangzhou, China, <b>Lecture Notes in
                    Computer Science</b> Volume 7936, 2013, pp 831-840.</li><BR>
            <li>Anurag Singh, Y.N. Singh, "Rumor dynamics with inoculations for
                correlated scale free networks", <b>National Conference on
                    Communications (NCC 2013)</b>, vol., no., pp.1,5, 15-17 Feb. 2013.
            </li><BR>
            <li>Anurag Singh and Yatindra Nath Singh. 2012. Rumor spreading and
                inoculation of nodes in complex networks. In <b>Proceedings of the 21st
                    International Conference Companion on World Wide Web (WWW '12
                    Companion). ACM, New York, NY.</b></li><BR>
            <li>Anurag Singh, R Kumar,, Y.N. Singh, "Rumor Dynamics with Acceptability
                Factor and Inoculation of Nodes in Scale Free Networks, "Signal Image
                Technology and Internet Based Systems (SITIS), <b>2012 Eighth
                    International Conference</b> on, vol., no., pp.798,804, 25-29 Nov.
                2012.</li><BR>
        </ul>"""
    
    page_slug = "home"
    profile_slug = "parvej"
    def handle(self, *args, **kwargs):
        soup = BeautifulSoup(self.data, 'html.parser')
        li_tags = soup.find_all('li')
        with transaction.atomic():
            page = Page.objects.get(slug=self.page_slug, profile__slug = self.profile_slug)
            component = Component.objects.create(
                page = page,
                title = "Conference Publications",
                layout = "publications",

            )
            sub_component = SubComponent.objects.create(
                component = component,
            )
            list_data = [li.text.strip() for li in li_tags if li and li.text.strip()]
            content_block = ContentBlock.objects.create(
                subcomponent = sub_component,
                content_type = "list",
                data  = list_data
            )
            print(f"Content Block created with id: {content_block.id}")
